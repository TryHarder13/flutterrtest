import 'dart:async';

import 'package:flutterrtest/test/studentversion3/student_getx/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//为了访问和使用数据库，创建单子DatabaseHelper类
//一个单子类将确保我们只有一个数据库连接的实例和对数据库的全局访问，可以从项目任何地方调用
//factory关键字被用来创建一个只返回实例的构造函数
class SDatabaseHelper {
  static final SDatabaseHelper _sdatabaseHelper = SDatabaseHelper._();

  SDatabaseHelper._();

  late Database db;

  factory SDatabaseHelper() {
    return _sdatabaseHelper;
  }

  //initDB()异步函数，将连接到SQLite数据库，getDatabasesPath()方法将给出数据库文件的默认位置
  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'demo.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE students (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              studentid TEXT NOT NULL,
              sname TEXT NOT NULL,
              ssex TEXT NOT NULL,
              sage INTEGER NOT NULL,
              sfaculty TEXT NOT NULL,
              smajor TEXT NOT NULL,
              sclass INTEGER NOT NULL, 
              sphone TEXT NOT NULL,
              spassword TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertStudent(Student student) async {
    int result = await db.insert('students', student.toMap());
    return result;
  }

  Future<int> updateStudent(Student student) async {
    int result = await db.update(
      'students',
      student.toMap(),
      where: "id = ?",
      whereArgs: [student.id],
    );
    return result;
  }

  Future<List<Student>> retrieveStudents() async {
    final List<Map<String, Object?>> queryResult = await db.query('students');
    return queryResult.map((e) => Student.fromMap(e)).toList();
  }

  Future<List<Student>> queryStudentsname(String s) async {
    final List<Map<String, Object?>> queryResult = await db.query(
      'students',
      where:"sname = ?" ,
      whereArgs: [s],
    );
    return queryResult.map((e) => Student.fromMap(e)).toList();
  }

  Future<List<Student>> StudentLoginsFlag(String sid) async {
      final List<Map<String, Object?>>queryResult = await db.query(
        'students',
        where: "studentid = ?",
        whereArgs: [sid],
      );
      return queryResult.map((e) => Student.fromMap(e)).toList();
  }

  Future<void> deleteStudent(int id) async {
    await db.delete(
      'students',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}

