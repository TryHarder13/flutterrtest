import 'package:flutter/material.dart';
import 'package:flutterrtest/routes/app_routes.dart';
import 'package:get/get.dart';

Widget createApp() {
  return GetMaterialApp(
    initialRoute: Routes.SPLASH, //定义闪屏页
    getPages: AppPages.pages, //定义app所有页面
    debugShowCheckedModeBanner: false,
  );
}