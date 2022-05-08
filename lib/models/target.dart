import 'package:flutter/material.dart';
import 'package:flutterrtest/utils/date_time.dart';
import 'package:flutterrtest/utils/util_object.dart';

enum TargetStatus {
  processing, //进行中
  completed, //已完成
  giveuped, //放弃
}

class Target {
  int? id;
  String? name;
  String? description;
  int? targetDays;
  Color? targetColor;
  String? soundKey;
  List<TimeOfDay>? notificationTimes;
  DateTime? createTime;
  DateTime? giveUpTime;

  TargetStatus? targetStatus;

  //clone方法通过一个对象快速复制出另一个对象
  Target clone() {
    return Target()
      ..id = id
      ..name = name
      ..description = description
      ..targetDays = targetDays
      ..targetColor = targetColor
      ..soundKey = soundKey
      ..notificationTimes = List.from(notificationTimes ?? [])
      ..createTime = createTime
      ..giveUpTime = giveUpTime
      ..targetStatus = targetStatus;
  }

  //将从数据库目标表中查询的目标map转化为Target类对象
  static Target? targetFromMap(Map<String, dynamic> map) {
    if (ObjectUtil.isEmpty(map)) return null;

    //目标颜色解析
    Color? color;

    String? colorString = map["t_colors"];
    if (!ObjectUtil.isEmptyString(colorString)) {
      List<String> items = colorString!.split("|");
      if (!ObjectUtil.isEmptyList(items) && items.length == 3) {
        try {
          color = Color.fromRGBO(
              int.parse(items[0]), int.parse(items[1]), int.parse(items[2]), 1);
        } catch (e) {
          color = null;
        }
      }
    }

    //目标推送时间段解析
    List<TimeOfDay>? times;

    String? notificationTimeString = map["t_notification_time"];
    if (!ObjectUtil.isEmptyString(notificationTimeString)) {
      List<String> items = notificationTimeString!.split("!");
      if (!ObjectUtil.isEmptyList(items)) {
        times = [];
        items.forEach((element) {
          TimeOfDay? timeOfDay = stringToTimeOfDay(element);
          if (timeOfDay != null) {
            times!.add(timeOfDay);
          }
        });
      }
    }

    //创建时间解析
    String createTimeString = map["t_createtime"];
    DateTime? createTime = stringToDataTime(createTimeString);

    //判断目标状态
    TargetStatus? targetStatus;
    DateTime? giveUpDate;

    if (map["t_giveuptime"] != null) {
      //已放弃
      targetStatus = TargetStatus.giveuped;

      String time = map["t_giveuptime"];
      giveUpDate = stringToDataTime(time);
    } else {
      //进行中或者已完成
      //获取目标完成时间
      DateTime completedTime =
          createTime!.add(Duration(days: map["t_days"] as int));

      if (DateTime.now().isBefore(completedTime)) {
        //状态进行中
        targetStatus = TargetStatus.processing;
      } else {
        //状态已完成
        targetStatus = TargetStatus.completed;
      }
    }

    return Target()
      ..id = map["id"] as int
      ..name = map["t_name"] as String
      ..targetDays = map["t_days"] as int
      ..targetColor = color
      ..soundKey = map["t_sound_key"]
      ..notificationTimes = times
      ..createTime = createTime
      ..giveUpTime = giveUpDate
      ..targetStatus = targetStatus;
  }
}
