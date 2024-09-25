import 'package:flutter/material.dart';
import 'package:todoiti/models/panel_model.dart';


class TaskBottomSheet extends StatefulWidget {
  final Function(PanelModel) onAdd;

  TaskBottomSheet({required this.onAdd});

  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final TextEditingController textController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<TaskItem> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(labelText: 'Enter Task'),
          ),
          ElevatedButton(
            onPressed: () {
              final task = TaskItem(description: textController.text, isDone: false);
              setState(() {
                tasks.add(task);
              });
              textController.clear();
            },
            child: Text('Add Task'),
          ),
          ElevatedButton(
            onPressed: () {
              final panel = PanelModel(items: tasks, time: selectedTime.format(context), isExpanded: false);
              widget.onAdd(panel);
              Navigator.pop(context);
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
