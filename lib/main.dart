import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoiti/models/panel_model.dart';
import 'package:todoiti/models/view_model.dart';

import 'home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PanelModelAdapter());
  Hive.registerAdapter(TaskItemAdapter());
  await Hive.openBox<PanelModel>('panels');

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
        ),
    ),
  );
}
