import 'package:flutter/material.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:get/get.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigatorBar(
      title: "关于",
      closeCallBack: () {
        print("返回到首页");
        Get.back();
      },
    ),
      body: Container(
          alignment: Alignment.topCenter,
          child: Padding(padding: EdgeInsets.only(top: 130),
            child: Image.asset("assets/images/aboutschool.jpg",width: 400,height: 300,),)

      ),
    );
  }
}
