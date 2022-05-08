// import 'dart:async';
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:study_project/administrator/administrator.dart';
//
// //为了访问和使用数据库，创建单子DatabaseHelper类
// //一个单子类将确保我们只有一个数据库连接的实例和对数据库的全局访问，可以从项目任何地方调用
// //factory关键字被用来创建一个只返回实例的构造函数
// class ADatabaseHelper {
//   static final ADatabaseHelper _adatabaseHelper = ADatabaseHelper._();
//
//   ADatabaseHelper._();
//
//   late Database db;
//
//   factory ADatabaseHelper() {
//     return _adatabaseHelper;
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
//             CREATE TABLE administrators (
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               administratorid TEXT NOT NULL,
//               aname TEXT NOT NULL,
//               apassword TEXT NOT NULL
//             )
//           """,
//         );
//       },
//       version: 1,
//     );
//   }
//
//   Future<int> insertAdminstrator(Administrator administrator) async {
//     int result = await db.insert('administrators', administrator.toMap());
//     return result;
//   }
//
//   Future<int> updateAdminstrator(Administrator administrator) async {
//     int result = await db.update(
//       'administrators',
//       administrator.toMap(),
//       where: "id = ?",
//       whereArgs: [administrator.id],
//     );
//     return result;
//   }
//
//   Future<List<Administrator>> retrieveAdministrators() async {
//     final List<Map<String, Object?>> queryResult = await db.query('administrators');
//     return queryResult.map((e) => Administrator.fromMap(e)).toList();
//   }
//
//   // Future<List<Student>> queryStudentsname(String s) async {
//   //   final List<Map<String, Object?>> queryResult = await db.query(
//   //     'students',
//   //     where:"sname = ?" ,
//   //     whereArgs: [s],
//   //   );
//   //   return queryResult.map((e) => Student.fromMap(e)).toList();
//   // }
//
//   Future<List<Administrator>> AdministratorLoginaFlag(String aid) async {
//     final List<Map<String, Object?>>queryResult = await db.query(
//       'administrators',
//       where: "administratorid = ?",
//       whereArgs: [aid],
//     );
//     return queryResult.map((e) => Administrator.fromMap(e)).toList();
//   }
//
//   Future<void> deleteAdministrator(int id) async {
//     await db.delete(
//       'administrators',
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }
//
// }
//
