import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/common/widgets/studentmessagetoast.dart';
import 'package:flutterrtest/core/database/studentdb.dart';
import 'package:flutterrtest/models/student.dart';
import 'package:flutterrtest/pages/student_update/student_update_controller.dart';
import 'package:get/get.dart';

class StudentUpdateEditPage extends StatefulWidget {
  @override
  _StudentUpdateEditPageState createState() => _StudentUpdateEditPageState();
}

class _StudentUpdateEditPageState extends State<StudentUpdateEditPage> {
  final StudentUpdateEditPagecontroller = Get.find<StudentUpdateController>();

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
  late Student studentedit = Get.arguments;

  @override
  void initState() {
    super.initState();
    this.sdbHelper = SDatabaseHelper();
    this.sdbHelper.initDB().whenComplete(() async {
      setState(() {
        print("------${studentedit.sname}");
        populateFields(studentedit);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false, //设置这个属性防止键盘覆盖内容或者键盘撑起内容
      appBar: NavigatorBar(
        title: "学生信息修改编辑",
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
                                onPressed: EditStudent,
                              ),
                            ),
                          ],
                        ),
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

  Future<void> EditStudent() async {
    String studentid = studentidController.text;
    String sname = snameController.text;
    String ssex = ssexController.text;
    String sage = sageController.text;
    String sfaculty = sfacultyController.text;
    String smajor = smajorController.text;
    String sclass = sclassController.text;
    String sphone = sphoneController.text;
    String spassword = spasswordController.text;

    studentedit.studentid = studentid;
    studentedit.sname = sname;
    studentedit.ssex = ssex;
    studentedit.sage = int.parse(sage);
    studentedit.sfaculty = sfaculty;
    studentedit.smajor = smajor;
    studentedit.sclass = int.parse(sclass);
    studentedit.sphone = sphone;
    studentedit.spassword = spassword;
    await updateStudent(studentedit);
    showupdatemessagesuccess();

    // Get.put(StudentUpdateController());
    Get.back();
    Get.back();
    // Get.toNamed(Routes.STUDENTUPDATE);
  }

  Future<int> updateStudent(Student student) async {
    return await this.sdbHelper.updateStudent(student);
  }

  void populateFields(Student student) {
    studentedit = student;
    studentidController.text = studentedit.studentid;
    snameController.text = studentedit.sname;
    ssexController.text = studentedit.ssex;
    sageController.text = studentedit.sage.toString();
    sfacultyController.text = studentedit.sfaculty;
    smajorController.text = studentedit.smajor;
    sclassController.text = studentedit.sclass.toString();
    sphoneController.text = studentedit.sphone;
    spasswordController.text = studentedit.spassword;
    isEditing = true;
  }

  // showupdatemessagesuccess() {
  //   Fluttertoast.showToast(
  //     msg: "修改成功",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.green,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
}
