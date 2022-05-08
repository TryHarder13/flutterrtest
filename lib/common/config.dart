import 'package:flutter/material.dart';
import 'package:flutterrtest/models/illustration.dart';
import 'package:flutterrtest/models/target.dart';

///通用文字颜色
final Color textBlackColor = Color.fromRGBO(69, 80, 97, 1);
///通用文字灰色
final Color textGreyColor = Color.fromRGBO(151, 158, 168, 1);
///通用文字蓝色
final Color commonBlueColor = Colors.blue;

final List splashIllustrations = [
  Illustration(
      asset: 'assets/illustrations/addressbook.svg',
      copyright: 'BSGStudio in all-free-download.com'
  ),
  Illustration(
      asset: 'assets/illustrations/addressbook.svg',
      copyright: 'BSGStudio in all-free-download.com'
  ),
];

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

final List<Target> defaultTargets = [
  Target()
  ..name = '明日校园'
  ..description = '告示栏信息'
  ..targetDays = 7
  ..targetColor = const Color.fromRGBO(156, 203, 233, 1)
  ..notificationTimes = [
    const TimeOfDay(hour: 10, minute: 00),
    const TimeOfDay(hour: 15, minute: 00),
    const TimeOfDay(hour: 20, minute: 00),
  ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(240, 199, 73, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(237, 135, 52, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(211, 88, 70, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(240, 199, 73, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(240, 199, 73, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(237, 135, 52, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
  Target()
    ..name = '明日校园'
    ..description = '告示栏信息'
    ..targetDays = 7
    ..targetColor = const Color.fromRGBO(211, 88, 70, 1)
    ..notificationTimes = [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 20, minute: 00),
    ],
];

List<String> bannerList = [
  "assets/illustrations/timg.jpeg",
  "assets/illustrations/timg.jpeg",
  "assets/illustrations/timg.jpeg",
  "assets/illustrations/timg.jpeg",
];


const MaterialColor white = const MaterialColor(0xFFFFFFFF, const <int, Color>{
  50: const Color(0xFFFFFFFF),
  100: Color(0xFFFFFFFF),
  200: Color(0xFFFFFFFF),
  300: Color(0xFFFFFFFF),
  400: Color(0xFFFFFFFF),
  500: Color(0xFFFFFFFF),
  600: Color(0xFFFFFFFF),
  700: Color(0xFFFFFFFF),
  800: Color(0xFFFFFFFF),
  900: Color(0xFFFFFFFF),
});

const MaterialColor primary = const MaterialColor(0xff739AF0, const <int, Color>{
  50: const Color(0xff739AF0),
  100: Color(0xff739AF0),
  200: Color(0xff739AF0),
  300: Color(0xff739AF0),
  400: Color(0xff739AF0),
  500: Color(0xff739AF0),
  600: Color(0xff739AF0),
  700: Color(0xff739AF0),
  800: Color(0xff739AF0),
  900: Color(0xff739AF0)
});

class BaColors{

  static const Color dark_bg= Colors.black;
}
