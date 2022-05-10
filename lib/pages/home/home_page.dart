import 'package:flutter/material.dart';
import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/common/widgets/home_page_tabview.dart';
import 'package:flutterrtest/models/banner_model.dart';
import 'package:flutterrtest/pages/home/home_controller.dart';
import 'package:flutterrtest/pages/mine/mine_page.dart';
import 'package:flutterrtest/pages/study/study_world_page.dart';
import 'package:flutterrtest/routes/app_routes.dart';
import 'package:flutterrtest/common/widgets/fsns_banner.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double bottomTabViewHeight = 70.0;

    final HomeController homeController = Get.find<HomeController>();

    var bannerJson = [
      {
        "desc": "一起来做个App吧",
        "id": 10,
        "imagePath":
            "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
        "isVisible": 1,
        "order": 1,
        "title": "一起来做个App吧",
        "type": 0,
        "url": "https://www.wanandroid.com/blog/show/2"
      },
      {
        "desc": "",
        "id": 6,
        "imagePath":
            "https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png",
        "isVisible": 1,
        "order": 1,
        "title": "我们新增了一个常用导航Tab~",
        "type": 1,
        "url": "https://www.wanandroid.com/navi"
      },
      {
        "desc": "",
        "id": 20,
        "imagePath":
            "https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png",
        "isVisible": 1,
        "order": 2,
        "title": "flutter 中文社区 ",
        "type": 1,
        "url": "https://flutter.cn/"
      }
    ];
    List<BannerModel> bannerList = bannerJson.map((e) {
      return BannerModel.fromMap(e);
    }).toList();

    _banner() {
      return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: FsnsBanner(
          bannerList,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        //SafeArea:除去刘海屏和下方安全区域
        child: Stack(
          children: [
            Positioned(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: homeController.pageController,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    //child: Text("任务列表页"),
                    //child: TargetPage(),
                    child: Column(
                      children: [
                        _banner(),
                        gridView(),
                        // BannerWidget(
                        //   imageList: bannerList,
                        // ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.TARGET);
                          },
                          child: Text("首页，包括相应信息"),
                        ),
                      ],
                    ),
                    // child: TextButton(
                    //   onPressed: () {
                    //     Get.toNamed(Routes.TARGET);
                    //   },
                    //   child: Text("任务列表页"),
                    // ),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Text("学生圈页，浏览"),
                    // child: ContactsList(),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: StudyWorldPage(),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    // child: Text("个人中心页"),
                    child: MinePage(),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: bottomTabViewHeight,
                child: HomePageTabView(
                  tabIcons: [
                    "assets/icons/home.svg",
                    "assets/icons/circle.svg",
                    "assets/icons/world.svg",
                    "assets/icons/people.svg",
                  ],
                  activeColor: commonBlueColor,
                  selectIndex: 0,
                  onPress: (index) {
                    homeController.pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                  pageTabTitle: [
                    "首页",
                    "学生圈",
                    "学习天地",
                    "我的",
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  gridView() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 5, right: 5),
      child: Container(
          child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        mainAxisSpacing: 0,
        crossAxisSpacing: 5,
        crossAxisCount: 4,
        children: [
          _buildGridItem('assets/row/add.png', '信息添加', cid: 1),
          _buildGridItem('assets/row/select.png', '信息查询', cid: 2),
          _buildGridItem('assets/row/update.png', '信息修改', cid: 3),
          _buildGridItem('assets/row/delete.png', '信息删除', cid: 4),
          _buildGridItem('assets/row/bulletinboard.png', '告示栏信息', cid: 5),
          _buildGridItem('assets/row/contacts.png', '联系人', cid: 6),
          _buildGridItem('assets/row/picture.png', '摄像乐园', cid: 7),
          _buildGridItem('assets/row/login.png', '登录', cid: 8),
        ],
      )),
    );
  }

  ///网格布局item
  _buildGridItem(String imgUrl, String title, {cid}) {
    return GestureDetector(
      onTap: () {
        switch (cid) {
          case 1:
            {
              Get.toNamed(Routes.STUDENTADD);
            }
            break;
          case 2:
            {
              Get.toNamed(Routes.STUDENTSELECT);
            }
            break;
          case 3:
            {
              Get.toNamed(Routes.STUDENTUPDATE);
            }
            break;
          case 4:
            {
              Get.toNamed(Routes.STUDENTDELETE);
            }
            break;
          case 5:
            {
              Get.toNamed(Routes.TARGET);
            }
            break;
          case 6:
            {
              Get.toNamed(Routes.CONTACTS);
            }
            break;
          case 7:
            {
              Get.toNamed(Routes.PICTURE);
            }
            break;
          case 8:
            {
              Get.toNamed(Routes.LOGIN);
            }
            break;
        }
      },
      child: Column(
        children: [
          Image(
            image: AssetImage(imgUrl),
            width: 30,
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              title,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }


}
