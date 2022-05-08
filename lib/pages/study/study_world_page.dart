import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrtest/core/api/http/dao/project_dao.dart';
import 'package:flutterrtest/models/study_world.dart';

class StudyWorldPage extends StatefulWidget {
  const StudyWorldPage({Key? key}) : super(key: key);

  @override
  _StudyWorldPageState createState() => _StudyWorldPageState();
}

class _StudyWorldPageState extends State<StudyWorldPage>
    with AutomaticKeepAliveClientMixin {
  List<StudyWorld> categoryList = [];
  List<Children> childList = [];

  @override
  void initState() {
    super.initState();
    _loadCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "学习天地",
      //     style: TextStyle(fontSize: 18),
      //   ),
      // ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryList[index].name!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black26,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      child: Wrap(
                        spacing: 12.0,
                        runSpacing: 8.0,
                        children: _buildItem(categoryList[index].children),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }

  List<Widget> _buildItem(List<Children>? list) {
    return list!.map((item) {
      return Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ActionChip(
          onPressed: () {
            // //跳转到相应的列表
            // FRouter.getInstance()!.onIntentTo(RouteStatus.article,
            //     args: {"article_cid": item.id, "article_title": item.name});
          },
          label: Text(item.name!),
          elevation: 5.0,
          backgroundColor:
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }).toList();
  }

  void _loadCategoryList() async {
    List<StudyWorld> categoryList = await ProjectDao.getCategory();
    setState(() {
      this.categoryList = categoryList;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
