import 'package:flutter/material.dart';
import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/common/widgets/studentmessagetoast.dart';
import 'package:flutterrtest/core/database/studentdb.dart';
import 'package:flutterrtest/models/student.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class StudentDeletePage extends StatefulWidget {

  @override
  _StudentDeletePageState createState() => _StudentDeletePageState();
}

class _StudentDeletePageState extends State<StudentDeletePage> {
  late SDatabaseHelper sdbHelper;

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
        title: "学生信息删除",
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
                Expanded(
                  flex: 1,
                  child: SafeArea(
                    child: studentWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget studentWidget() {
    return FutureBuilder(
      future: this.sdbHelper.retrieveStudents(),
      builder: (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  key: UniqueKey(),
                  onDismissed: (DismissDirection direction) async {
                    if(Global.userLoginContent == 1){
                      await this.sdbHelper.deleteStudent(snapshot.data![position].id!);
                      showdeletemessagesuccess();
                    }else{
                      showdeletewarn();
                      Get.back();
                    }
                  },
                  child: new GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    // onTap: () => populateFields(snapshot.data![position]),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      12.0, 12.0, 12.0, 6.0),
                                  child: Text(
                                    snapshot.data![position].sname,
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      12.0, 6.0, 12.0, 12.0),
                                  child: Text(
                                    snapshot.data![position].smajor.toString(),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data![position].studentid.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 2.0,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // showdeletemessagesuccess() {
  //   Fluttertoast.showToast(
  //     msg: "删除成功",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.green,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
  //
  // showwarn() {
  //   Fluttertoast.showToast(
  //     msg: "您无权删除学生信息，请找管理员",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
}
