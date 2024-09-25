import 'package:hive/hive.dart';
import 'package:todoiti/models/panel_model.dart';

class TaskRepository {
  Box<PanelModel> get panelsBox => Hive.box<PanelModel>('panels');

  Future<List<PanelModel>> getPanels() async {
    return panelsBox.values.toList();
  }

  Future<void> addPanel(PanelModel panel) async {
    await panelsBox.add(panel);
  }

  Future<void> deletePanel(int index) async {
    await panelsBox.deleteAt(index);
  }

  Future<void> updatePanel(int index, PanelModel panel) async {
    await panelsBox.putAt(index, panel);
  }
}
