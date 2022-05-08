import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterrtest/common/widgets/common_button.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/core/database/studentdb.dart';
import 'package:flutterrtest/models/student.dart';
import 'package:flutterrtest/test/student_version1/studentdb.dart';
import 'package:get/get.dart';

class StudentAddPage extends StatefulWidget {

  @override
  _StudentAddPageState createState() => _StudentAddPageState();
}

class _StudentAddPageState extends State<StudentAddPage> {
  late SDatabaseHelper sdbHelper;
  final studentidController = TextEditingController();
  final snameController = TextEditingController();
  final ssexController = TextEditingController();
  final sageController = TextEditingController();
  final sfacultyController = TextEditingController();
  final smajorController = TextEditingController();
  final sclassController = TextEditingController();
  final sphoneController = TextEditingController();
  final spasswordController = TextEditingController();

  bool isEditing = false;
  late Student _student;

  @override
  void initState() {
    super.initState();
    this.sdbHelper = SDatabaseHelper();
    this.sdbHelper.initDB().whenComplete(() async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //设置这个属性防止键盘覆盖内容或者键盘撑起内容
      appBar: NavigatorBar(
        title: "学生信息添加",
        closeCallBack: () {
          print("返回到首页");
          Get.back();
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: new Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: studentidController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的学号', labelText: '学号'),
                        ),
                        TextFormField(
                          controller: snameController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的姓名', labelText: '姓名'),
                        ),
                        TextFormField(
                          controller: ssexController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的性别', labelText: '性别'),
                        ),
                        TextFormField(
                          controller: sageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                              hintText: '请输入你的年龄', labelText: '年龄'),
                        ),
                        TextFormField(
                          controller: sfacultyController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的院系', labelText: '院系'),
                        ),
                        TextFormField(
                          controller: smajorController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的专业', labelText: '专业'),
                        ),
                        TextFormField(
                          controller: sclassController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                              hintText: '请输入你的班级', labelText: '班级'),
                        ),
                        TextFormField(
                          controller: sphoneController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的电话', labelText: '电话'),
                        ),
                        TextFormField(
                          controller: spasswordController,
                          decoration: const InputDecoration(
                              hintText: '请输入你的密码', labelText: '密码'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            new Container(
                              margin: new EdgeInsets.symmetric(vertical: 10),
                              child: new ElevatedButton(
                                child: const Text('提交'),
                                onPressed: addOrEditStudent,
                              ),
                              // child: CommonButton(
                              //   title: '信息提交',
                              //   onPressed: addOrEditStudent,
                              // ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                        //   child: CommonButton(
                        //     title: '添加信息',
                        //     onPressed: addOrEditStudent,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addOrEditStudent() async {
    String studentid = studentidController.text;
    String sname = snameController.text;
    String ssex = ssexController.text;
    String sage = sageController.text;
    String sfaculty = sfacultyController.text;
    String smajor = smajorController.text;
    String sclass = sclassController.text;
    String sphone = sphoneController.text;
    String spassword = spasswordController.text;


    if (!isEditing) {
      Student student = new Student(
        studentid: studentid,
        sname: sname,
        ssex: ssex,
        sage: int.parse(sage),
        sfaculty: sfaculty,
        smajor: smajor,
        sclass: int.parse(sclass),
        sphone: sphone,
        spassword: spassword,);
      await addStudent(student);
    } else {
      _student.studentid = studentid;
      _student.sname = sname;
      _student.ssex = ssex;
      _student.sage = int.parse(sage);
      _student.sfaculty = sfaculty;
      _student.smajor = smajor;
      _student.sclass = int.parse(sclass);
      _student.sphone = sphone;
      _student.spassword = spassword;
      await updateStudent(_student);
    }
    resetData();
    setState(() {});
  }

  Future<int> addStudent(Student student) async {
    return await this.sdbHelper.insertStudent(student);
  }

  Future<int> updateStudent(Student student) async {
    return await this.sdbHelper.updateStudent(student);
  }

  void resetData() {
    studentidController.clear();
    snameController.clear();
    ssexController.clear();
    sageController.clear();
    sfacultyController.clear();
    smajorController.clear();
    sclassController.clear();
    sphoneController.clear();
    spasswordController.clear();
    isEditing = false;
  }

  void populateFields(Student student) {
    _student = student;
    studentidController.text = _student.studentid;
    snameController.text = _student.sname;
    ssexController.text = _student.ssex;
    sageController.text = _student.sage.toString();
    sfacultyController.text = _student.sfaculty;
    smajorController.text = _student.smajor;
    sclassController.text = _student.sclass.toString();
    sphoneController.text = _student.sphone;
    spasswordController.text = _student.spassword;
    isEditing = true;
  }
}
