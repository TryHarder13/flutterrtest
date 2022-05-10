import 'package:flutter/material.dart';
import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/core/database/administratordb.dart';
import 'package:flutterrtest/core/database/studentdb.dart';
import 'package:flutterrtest/core/database/teacherdb.dart';
import 'package:flutterrtest/models/administrator.dart';
import 'package:flutterrtest/models/student.dart';
import 'package:flutterrtest/models/teacher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SDatabaseHelper sdbHelper;
  late ADatabaseHelper adbHelper;
  late TDatabaseHelper tdbHelper;

  int loginflag = 1;
  final useridController = TextEditingController();
  final userpasswordController = TextEditingController();

  late int userLoginflag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigatorBar(
        title: "登录",
        closeCallBack: () {
          print("返回到首页");
          Get.back();
        },
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              height: 220,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage('assets/images/welcomelogin.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              top: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: ListView(
                  children: [
                    TextFormField(
                      controller: useridController,
                      decoration: const InputDecoration(
                          hintText: '请输入您的编号', labelText: '账号：'),
                    ),
                    TextFormField(
                      controller: userpasswordController,
                      decoration: const InputDecoration(
                          hintText: '请输入您的密码', labelText: '密码：'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: new ElevatedButton(
                        child: const Text('登录'),
                        onPressed: login,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> login() async {
    String userid = useridController.text;
    String userpassword = userpasswordController.text;

    try {
      this.adbHelper = ADatabaseHelper();
      List<Administrator> a =
          await this.adbHelper.AdministratorLoginaFlag(userid);
      print("------------${a[0].apassword}----------");
      print("------------是管理员的账号----------");
      userLoginflag = 1;
    } catch (e) {
      print("------------不是管理员的账号----------");
    }

    try {
      this.tdbHelper = TDatabaseHelper();
      List<Teacher> t = await this.tdbHelper.TeacherLogintFlag(userid);
      print("------------${t[0].tpassword}----------");
      print("------------是老师的账号----------");
      userLoginflag = 2;
    } catch (e) {
      print("------------不是老师的账号----------");
    }

    try {
      this.sdbHelper = SDatabaseHelper();
      List<Student> s = await this.sdbHelper.StudentLoginsFlag(userid);
      print("------------${s[0].spassword}----------");
      print("------------是学生的账号----------");
      userLoginflag = 3;
    } catch (e) {
      print("------------不是学生的账号----------");
    }

    try {
      switch (userLoginflag) {
        case 1:
          this.adbHelper = ADatabaseHelper();
          List<Administrator> a = await this.adbHelper.AdministratorLoginaFlag(userid);
          if (userpassword == a[0].apassword) {
            showloginsuccess();
            Global.userLoginContent = 1;
            print("----------管理员登录成功${Global.userLoginContent}----------");
            Get.back();
            return loginflag;
          } else {
            print("----------账号密码不匹配----------");
            userpasswordController.clear();
            showloginfail();
            loginflag = 2;
            return loginflag;
          }
        case 2:
          this.tdbHelper = TDatabaseHelper();
          List<Teacher> t = await this.tdbHelper.TeacherLogintFlag(userid);
          if (userpassword == t[0].tpassword) {
            showloginsuccess();
            Global.userLoginContent = 2;
            print("----------老师登录成功${Global.userLoginContent}----------");
            Get.back();
            return loginflag;
          } else {
            print("----------账号密码不匹配----------");
            userpasswordController.clear();
            showloginfail();
            loginflag = 2;
            return loginflag;
          }
        case 3:
          this.sdbHelper = SDatabaseHelper();
          List<Student> s = await this.sdbHelper.StudentLoginsFlag(userid);
          if (userpassword == s[0].spassword) {
            showloginsuccess();
            Global.userLoginContent = 3;
            print("----------学生登录成功${Global.userLoginContent}----------");
            Get.back();
            return loginflag;
          } else {
            print("----------账号密码不匹配----------");
            userpasswordController.clear();
            showloginfail();
            loginflag = 2;
            return loginflag;
          }
        default:
          return loginflag;
      }
    } catch (e) {
      showloginfalse();
      return loginflag;
    }
  }

  showloginsuccess() {
    String loginsuccessmsg = "";
    switch (userLoginflag) {
      case 1:
        loginsuccessmsg = "管理员登录成功";
        break;
      case 2:
        loginsuccessmsg = "老师登录成功";
        break;
      case 3:
        loginsuccessmsg = "学生登录成功";
        break;
    }
    Fluttertoast.showToast(
        msg: loginsuccessmsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showloginfail() {
    Fluttertoast.showToast(
        msg: "账号密码不匹配，请重新输入",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showloginfalse() {
    Fluttertoast.showToast(
        msg: "没有此账号信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
