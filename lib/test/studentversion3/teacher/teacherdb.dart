// import 'dart:async';
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:study_project/teacher/teacher.dart';
//
// //为了访问和使用数据库，创建单子DatabaseHelper类
// //一个单子类将确保我们只有一个数据库连接的实例和对数据库的全局访问，可以从项目任何地方调用
// //factory关键字被用来创建一个只返回实例的构造函数
// class TDatabaseHelper {
//   static final TDatabaseHelper _tdatabaseHelper = TDatabaseHelper._();
//
//   TDatabaseHelper._();
//
//   late Database db;
//
//   factory TDatabaseHelper() {
//     return _tdatabaseHelper;
//   }
//
//   //initDB()异步函数，将连接到SQLite数据库，getDatabasesPath()方法将给出数据库文件的默认位置
//   Future<void> initDB() async {
//     String path = await getDatabasesPath();
//     db = await openDatabase(
//       join(path, 'demo.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//           """
//             CREATE TABLE teachers (
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               teacherid TEXT NOT NULL,
//               tname TEXT NOT NULL,
//               tfaculty TEXT NOT NULL,
//               tpassword TEXT NOT NULL
//             )
//           """,
//         );
//       },
//       version: 1,
//     );
//   }
//
//   Future<int> inserTeacher(Teacher teacher) async {
//     int result = await db.insert('teachers', teacher.toMap());
//     return result;
//   }
//
//   Future<int> updatTeacher(Teacher teacher) async {
//     int result = await db.update(
//       'teachers',
//       teacher.toMap(),
//       where: "id = ?",
//       whereArgs: [teacher.id],
//     );
//     return result;
//   }
//
//   Future<List<Teacher>> retrieveTeachers() async {
//     final List<Map<String, Object?>> queryResult = await db.query('teachers');
//     return queryResult.map((e) => Teacher.fromMap(e)).toList();
//   }
//
//   Future<List<Teacher>> queryTeachertfaculty(String tf) async {
//     final List<Map<String, Object?>> queryResult = await db.query(
//       'teachers',
//       where:"tfaculty = ?" ,
//       whereArgs: [tf],
//     );
//     return queryResult.map((e) => Teacher.fromMap(e)).toList();
//   }
//
//   Future<List<Teacher>> TeacherLoginaFlag(String tid) async {
//     final List<Map<String, Object?>>queryResult = await db.query(
//       'teachers',
//       where: "teacherid = ?",
//       whereArgs: [tid],
//     );
//     return queryResult.map((e) => Teacher.fromMap(e)).toList();
//   }
//
//   Future<void> deleteTeacher(int id) async {
//     await db.delete(
//       'teachers',
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }
//
// }
//
