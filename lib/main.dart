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

  // SDatabaseHelper sdbHelper;
  // sdbHelper = SDatabaseHelper();
  // sdbHelper.initDB();
  // Future<int> addStudent(Student student) async {
  //   return await sdbHelper.insertStudent(student);
  // }
  // Student st1 = Student(studentid: 'studentid1',sname: 'sname',ssex: 'ssex',sage: 22,sfaculty: 'sfaculty',smajor: 'smajor',sclass: 132,sphone: 'sphone', spassword: 'spassword');
  // Student st2 = Student(studentid: 'studentid2',sname: 'sname',ssex: 'ssex',sage: 22,sfaculty: 'sfaculty',smajor: 'smajor',sclass: 132,sphone: 'sphone', spassword: 'spassword');
  // List <Student>s = [st1,st2];
  // // addStudent(st1);
  // // addStudent(st2);
  // for(int i = 0; i < s.length; i++){
  //   addStudent(s[i]);
  // }

}