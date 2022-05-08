import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum NavigetorBarCloseType {
  close,
  back,
}

class NavigatorBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigatorBar({
    Key? key,
    this.navigetorBarCloseType = NavigetorBarCloseType.back,
    this.height = 55.0,
    this.bgcolor = const Color.fromRGBO(244, 245, 246, 1),
    this.basecolor = Colors.blue,
    this.title,
    this.closeCallBack,
  }) : super(key: key);

  final NavigetorBarCloseType? navigetorBarCloseType;
  final double? height;
  final Color? bgcolor;
  final Color? basecolor;
  final String? title;
  final Function? closeCallBack;

  //通用导航条的布局
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgcolor,
      padding: EdgeInsets.only(top: Get.context!.mediaQueryPadding.top), //获取了状态栏的高度
      child: Stack(
        children: [
          //导航栏中间标题
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 22,
                  color: basecolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          //导航栏左侧的按钮
          Positioned(
            top: 0,
            bottom: 0,
            left: 10,
            child: Container(
              //color: Colors.red,
              width: height,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  closeCallBack?.call();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                child: navigetorBarCloseType == NavigetorBarCloseType.close
                    ? SvgPicture.asset(
                        'assets/navigator/close.svg',
                        width: 35,
                        height: 35,
                        color: basecolor,
                      )
                    : SvgPicture.asset(
                        'assets/navigator/back.svg',
                        width: 35,
                        height: 35,
                        color: basecolor,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //设置导航条的尺寸
  @override
  Size get preferredSize => Size.fromHeight(height!);
}


articleAppBar(String title){
  return AppBar(
    centerTitle: true,
    leading: BackButton(),
    title: Text(
      title,
      style: TextStyle(fontSize: 18),
    ),
  );
}