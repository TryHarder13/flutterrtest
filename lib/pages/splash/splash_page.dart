import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/models/illustration.dart';
import 'package:flutterrtest/pages/splash/splash_controller.dart';
import 'package:flutterrtest/routes/app_routes.dart';
import 'package:get/get.dart';

///页面布局

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageViewWidget(),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewWidgetState();
  }
}

class _PageViewWidgetState extends State<PageViewWidget> {
  SplashController splashController = Get.find<SplashController>();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, //假如没有子就舒展
      children: [
        PageView.builder(
            pageSnapping: true, //默认为true，当划过一半时自动显示下一个页面
            itemCount: 2,
            onPageChanged: (index) {
              //监听页面滚动
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              //index当前页码

              if (index > splashController.illustrations.length - 1)
                return const SizedBox.shrink();

              Illustration illustration = splashController.illustrations[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height / 2 - (Get.width - 40) / 2 - 50),
                    child: SvgPicture.asset(
                      illustration.asset!,
                      height: Get.width - 40,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 20),
                    width: double.infinity,
                    child: Text(
                      illustration.copyright ?? "",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: textGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  index == splashController.illustrations.length - 1
                      ? Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: 260,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.HOME);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return commonBlueColor;
                                }),
                                textStyle: MaterialStateProperty.all(
                                    //定义文本样式 这里设置的颜色是不起作用的
                                    TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  //fontFamily: getFontFamilyLanguage()
                                )),
                                //设置按钮上字体与图标的颜色
                                foregroundColor:
                                    MaterialStateProperty.all(textBlackColor),
                                //圆角
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0)))),
                            child: Text('开启明日校园'),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: 220,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '保持良好生活习惯',
                            style: TextStyle(
                                color: textBlackColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                ],
              );
            }),
        Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 40, //底部按钮适配安全区
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 0
                          ? Colors.grey
                          : Colors.grey.withOpacity(0.7)),
                ),
                Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 1
                          ? Colors.grey
                          : Colors.grey.withOpacity(0.7)),
                ),
              ],
            ))
      ],
    );
  }
}
