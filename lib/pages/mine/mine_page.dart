import 'package:flutter/material.dart';
import 'package:flutterrtest/routes/app_routes.dart';
import 'package:get/get.dart';
import 'mine_cell.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(220, 220, 220, 1.0),
        child: MediaQuery.removePadding(
          removeTop: true, //去掉导航栏的间隙
          context: context,
          child: ListView(
            children: [
              //头部
              // headerWidget(),
              ClipRRect(
                //borderRadius: BorderRadius.circular(0),
                child: Image(
                  // width: 60,
                  // height: 60,
                  image: AssetImage('assets/banner/goodpeople.png'),
                ),
              ),
              //列表 cell
              Column(children: [
                const SizedBox(
                  height: 10,
                ),
                // const MineCell(
                //   imageName: 'assets/row/3.png',
                //   title: '支付',
                // ),
                ///详情页（一张图片）
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    color: Colors.white,
                    height: 54,
                    child: Row(
                      //主轴方向设置
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //left
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/row/3.png'),
                                width: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text('登录'),
                            ],
                          ),
                        ),
                        //箭头
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Image(
                            image: AssetImage('assets/row/icon_right.png'),
                            width: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MineCell(
                  imageName: 'assets/row/3.png',
                  title: '收藏',
                ),
                //cell 底部分割线
                Row(
                  children: <Widget>[
                    //左右
                    Container(width: 50, height: 0.5, color: Colors.white),
                    //Container(height: 0.5, color: Colors.grey)
                  ],
                ),
                const MineCell(
                  imageName: 'assets/row/3.png',
                  title: '相册',
                ),
                Row(
                  children: <Widget>[
                    Container(width: 50, height: 0.5, color: Colors.white),
                    Container(height: 0.5, color: Colors.grey)
                  ],
                ),
                const MineCell(
                  imageName: 'assets/row/3.png',
                  title: '卡包',
                ),
                Row(
                  children: <Widget>[
                    Container(width: 50, height: 0.5, color: Colors.white),
                    Container(height: 0.5, color: Colors.grey)
                  ],
                ),
                // const MineCell(
                //   imageName: 'assets/row/3.png',
                //   title: '详情',
                // ),
                ///详情页（一张图片）
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.ABOUT);
                  },
                  child: Container(
                    color: Colors.white,
                    height: 54,
                    child: Row(
                      //主轴方向设置
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //left
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/row/3.png'),
                                width: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text('详情'),
                            ],
                          ),
                        ),
                        //箭头
                        Container(
                          padding: EdgeInsets.all(10),
                          child: const Image(
                            image: AssetImage('assets/row/icon_right.png'),
                            width: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MineCell(
                  imageName: 'assets/row/3.png',
                  title: '设置',
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
