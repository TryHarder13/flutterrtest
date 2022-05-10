import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
///学生信息添加
showaddmessagesuccess() {
  Fluttertoast.showToast(
    msg: "添加成功",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showaddwarn() {
  Fluttertoast.showToast(
    msg: "您无权添加学生信息，请找管理员",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


///学生信息删除
showdeletemessagesuccess() {
  Fluttertoast.showToast(
    msg: "删除成功",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showdeletewarn() {
  Fluttertoast.showToast(
    msg: "您无权删除学生信息，请找管理员",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

///学生信息修改
showupdatemessagesuccess() {
  Fluttertoast.showToast(
    msg: "修改成功",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}