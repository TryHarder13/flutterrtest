import 'package:flutter/material.dart';
import 'package:flutterrtest/app.dart';
import 'package:flutterrtest/core/database/providers/note_table_provider.dart';
import 'package:flutterrtest/core/database/providers/target_table_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _createTables();
  runApp(createApp());
}

void _createTables() async{
  //把两个表的操作对象类初始化
  TargetTableProvider targetTableProvider = TargetTableProvider();
  NoteTableProvider noteTableProvider = NoteTableProvider();

  await targetTableProvider.createTable();
  await noteTableProvider.createTable();
}