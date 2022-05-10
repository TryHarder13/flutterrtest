import 'package:flutter/material.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/core/database/studentdb.dart';
import 'package:flutterrtest/models/student.dart';
import 'package:get/get.dart';

class StudentSelectPage extends StatefulWidget {

  @override
  _StudentSelectPageState createState() => _StudentSelectPageState();
}

class _StudentSelectPageState extends State<StudentSelectPage> {
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
        title: "学生信息查询",
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

  Widget studentWidget() {
    return FutureBuilder(
      future: this.sdbHelper.retrieveStudents(),
      builder: (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    print("---------------wbeidianjl-------------");
                  },
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
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
