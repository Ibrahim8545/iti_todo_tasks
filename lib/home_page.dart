import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoiti/models/view_model.dart';

import 'widgets/task_bottom_sheet.dart';
import 'widgets/expansion_panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Task Manager')),
      body: ListView.builder(
        itemCount: viewModel.panels.length,
        itemBuilder: (context, index) {
          final panel = viewModel.panels[index];
          return ExpansionPanelItem(
            panel: panel,
            onDeleteTask: (task) {
              viewModel.deleteTask(index, task);
              if (panel.items.isEmpty) {
                viewModel.deletePanel(index);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TaskBottomSheet(
                onAdd: (panel) {
                  viewModel.addPanel(panel);
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
