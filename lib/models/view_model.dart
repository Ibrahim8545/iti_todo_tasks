import 'package:flutter/material.dart';
import 'package:todoiti/repo/task_repo_hive.dart';

import 'panel_model.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepository();
  List<PanelModel> _panels = [];

  List<PanelModel> get panels => _panels;

  TaskViewModel() {
    fetchPanels();
  }

  Future<void> fetchPanels() async {
    _panels = await _taskRepository.getPanels();
    notifyListeners();
  }

  Future<void> addPanel(PanelModel panel) async {
    await _taskRepository.addPanel(panel);
    await fetchPanels();
  }

  Future<void> deletePanel(int index) async {
    await _taskRepository.deletePanel(index);
    await fetchPanels();
  }

  void editTask(int panelIndex, TaskItem task, String newDescription) {
    task.description = newDescription;
    _panels[panelIndex].items[panelIndex] = task;
    notifyListeners();
  }

  void deleteTask(int panelIndex, TaskItem task) {
    _panels[panelIndex].items.remove(task);
    notifyListeners();
  }
}
