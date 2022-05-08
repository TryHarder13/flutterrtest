import 'package:flutter/material.dart';


class SCLMineModel {
  SCLMineModel({required this.icon, this.title = '', this.screen});

  String icon;
  String title;
  Widget? screen;

  static List<SCLMineModel> commonUseList = [
    SCLMineModel(
        icon: "assets/bling/me/me_icon_fangyi@3x.png",
        title: "想法",
        //screen: Thinking(),
    ),
    SCLMineModel(
        icon: "assets/bling/me/me_icon_invite@3x.png",
        title: "邀请",
        //screen: NavigationHomeScreen(),
    ),
    SCLMineModel(
        icon: "assets/bling/me/me_icon_downloadapp@3x.png", title: "下载app"),
    SCLMineModel(
        icon: "assets/bling/me/me_icon_setting@3x.png",
        title: "设置",
        //screen: SettingScreen(),
    ),
  ];

  static List<SCLMineModel> mineList = [
    SCLMineModel(
        icon: "assets/bling/me/me_icon_circle@3x.png",
        title: "朋友圈",
        //screen: Circle(),
    ),
    SCLMineModel(icon: "assets/bling/me/me_icon_home@3x.png", title: "个人主页"),
    SCLMineModel(icon: "assets/bling/me/me_icon_collect@3x.png", title: "收藏"),
  ];
}

enum SettingCellType { normal, checkVersion, loginOut, empty }

class SettingModel {
  String title;
  SettingCellType type;
  SettingModel({this.title = "", this.type = SettingCellType.normal});

  static List<SettingModel> settingList = [
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "账号与安全"),
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "新消息通知"),
    SettingModel(title: "勿扰模式"),
    SettingModel(title: "隐私"),
    SettingModel(title: "通用"),
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "检查新版本", type: SettingCellType.checkVersion),
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "退出登录", type: SettingCellType.loginOut),
  ];
}