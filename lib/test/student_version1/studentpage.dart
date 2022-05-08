// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutterrtest/test/student_version1/student.dart';
// import 'package:flutterrtest/test/student_version1/studentdb.dart';
//
// void main() {
//   runApp(SqliteDemoApp());
// }
//
// class SqliteDemoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SSQLite demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MainApp(title: 'SSQLite demo'),
//     );
//   }
// }
//
// class MainApp extends StatefulWidget {
//   MainApp({Key? key, this.title}) : super(key: key);
//   final String? title;
//
//   @override
//   _MainAppState createState() => _MainAppState();
// }
//
// class _MainAppState extends State<MainApp> {
//   late SDatabaseHelper sdbHelper;
//   final studentidController = TextEditingController();
//   final snameController = TextEditingController();
//   final ssexController = TextEditingController();
//   final sageController = TextEditingController();
//   final sfacultyController = TextEditingController();
//   final smajorController = TextEditingController();
//   final sclassController = TextEditingController();
//   final sphoneController = TextEditingController();
//   final spasswordController = TextEditingController();
//
//   bool isEditing = false;
//   late Student _student;
//
//   @override
//   void initState() {
//     super.initState();
//     this.sdbHelper = SDatabaseHelper();
//     this.sdbHelper.initDB().whenComplete(() async {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, //设置这个属性防止键盘覆盖内容或者键盘撑起内容
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: new Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Form(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TextFormField(
//                           controller: studentidController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的学号', labelText: '学号'),
//                         ),
//                         TextFormField(
//                           controller: snameController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的姓名', labelText: '姓名'),
//                         ),
//                         TextFormField(
//                           controller: ssexController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的性别', labelText: '性别'),
//                         ),
//                         TextFormField(
//                           controller: sageController,
//                           keyboardType: TextInputType.number,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                           ],
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的年龄', labelText: '年龄'),
//                         ),
//                         TextFormField(
//                           controller: sfacultyController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的院系', labelText: '院系'),
//                         ),
//                         TextFormField(
//                           controller: smajorController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的专业', labelText: '专业'),
//                         ),
//                         TextFormField(
//                           controller: sclassController,
//                           keyboardType: TextInputType.number,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                           ],
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的班级', labelText: '班级'),
//                         ),
//                         TextFormField(
//                           controller: sphoneController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的电话', labelText: '电话'),
//                         ),
//                         TextFormField(
//                           controller: spasswordController,
//                           decoration: const InputDecoration(
//                               hintText: '请输入你的密码', labelText: '密码'),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             new Container(
//                               margin: new EdgeInsets.symmetric(vertical: 10),
//                               child: new ElevatedButton(
//                                 child: const Text('提交'),
//                                 onPressed: addOrEditStudent,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: SafeArea(
//                     child: studentWidget(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> addOrEditStudent() async {
//     String studentid = studentidController.text;
//     String sname = snameController.text;
//     String ssex = ssexController.text;
//     String sage = sageController.text;
//     String sfaculty = sfacultyController.text;
//     String smajor = smajorController.text;
//     String sclass = sclassController.text;
//     String sphone = sphoneController.text;
//     String spassword = spasswordController.text;
//
//
//     if (!isEditing) {
//       Student student = new Student(
//           studentid: studentid,
//           sname: sname,
//           ssex: ssex,
//           sage: int.parse(sage),
//           sfaculty: sfaculty,
//           smajor: smajor,
//           sclass: int.parse(sclass),
//           sphone: sphone,
//           spassword: spassword,);
//       await addStudent(student);
//     } else {
//       _student.studentid = studentid;
//       _student.sname = sname;
//       _student.ssex = ssex;
//       _student.sage = int.parse(sage);
//       _student.sfaculty = sfaculty;
//       _student.smajor = smajor;
//       _student.sclass = int.parse(sclass);
//       _student.sphone = sphone;
//       _student.spassword = spassword;
//       await updateStudent(_student);
//     }
//     resetData();
//     setState(() {});
//   }
//
//   Future<int> addStudent(Student student) async {
//     return await this.sdbHelper.insertStudent(student);
//   }
//
//   Future<int> updateStudent(Student student) async {
//     return await this.sdbHelper.updateStudent(student);
//   }
//
//   void resetData() {
//     studentidController.clear();
//     snameController.clear();
//     ssexController.clear();
//     sageController.clear();
//     sfacultyController.clear();
//     smajorController.clear();
//     sclassController.clear();
//     sphoneController.clear();
//     spasswordController.clear();
//     isEditing = false;
//   }
//
//   Widget studentWidget() {
//     return FutureBuilder(
//       future: this.sdbHelper.retrieveStudents(),
//       builder: (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, position) {
//                 return Dismissible(
//                   direction: DismissDirection.endToStart,
//                   background: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerRight,
//                     padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Icon(Icons.delete_forever),
//                   ),
//                   key: UniqueKey(),
//                   onDismissed: (DismissDirection direction) async {
//                     await this
//                         .sdbHelper
//                         .deleteStudent(snapshot.data![position].id!);
//                   },
//                   child: new GestureDetector(
//                     behavior: HitTestBehavior.opaque,
//                     onTap: () => populateFields(snapshot.data![position]),
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.fromLTRB(
//                                       12.0, 12.0, 12.0, 6.0),
//                                   child: Text(
//                                     snapshot.data![position].sname,
//                                     style: TextStyle(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.fromLTRB(
//                                       12.0, 6.0, 12.0, 12.0),
//                                   child: Text(
//                                     snapshot.data![position].smajor.toString(),
//                                     style: TextStyle(fontSize: 18.0),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.black26,
//                                         borderRadius:
//                                         BorderRadius.circular(100)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         snapshot.data![position].studentid.toString(),
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           height: 2.0,
//                           color: Colors.grey,
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
//
//   void populateFields(Student student) {
//     _student = student;
//     studentidController.text = _student.studentid;
//     snameController.text = _student.sname;
//     ssexController.text = _student.ssex;
//     sageController.text = _student.sage.toString();
//     sfacultyController.text = _student.sfaculty;
//     smajorController.text = _student.smajor;
//     sclassController.text = _student.sclass.toString();
//     sphoneController.text = _student.sphone;
//     spasswordController.text = _student.spassword;
//     isEditing = true;
//   }
// }
