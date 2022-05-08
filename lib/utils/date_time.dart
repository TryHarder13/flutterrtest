import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatter_1 = "yyyy.MM.dd HH:mm:ss";
String formatter_2 = "yyyy.MM.dd HH:mm";

//10:30 14:10
//字符串转TimeOfDay
TimeOfDay? stringToTimeOfDay(String? string){
  if(ObjectUtil.isEmptyString(string)) return null;

  List<String> items = string!.split(":");
  if(ObjectUtil.isEmptyList(items)) return null;

  if(items.length != 2) return null;

  TimeOfDay? timeOfDay;
  try {
    timeOfDay = TimeOfDay(hour: int.parse(items[0]), minute: int.parse(items[1]));
  } catch(e) {
    timeOfDay = null;
  }

  return timeOfDay;
}

//2020.10.25 10:10:01
//字符串转DateTime
DateTime? stringToDataTime(String dateString){
  String formattedString = dateString.replaceAll(".", "-");

  DateTime? dateTime;

  try{
    dateTime = DateTime.parse(formattedString);
  } catch(e) {
    dateTime = null;
  }

  return dateTime;
}

//把DateTime转String
String? formatTime({String? formatter,DateTime? dateTime}){

  if(dateTime == null) return null;

  String formatterString = ObjectUtil.isEmptyString(formatter) ? formatter_1 : formatter!;

  var dateFormatter = DateFormat(formatterString);
  //可以加上try catch
  String? dateTimeString;
  try{
    dateTimeString = dateFormatter.format(dateTime);
  } catch (e) {
    dateTimeString = null;
  }
  return dateTimeString;

}

//将TimeOfDay对象转换为字符串
String? timeOfDayToString(TimeOfDay timeOfDay) {
  String? hourString;
  if(timeOfDay.hour < 10){
    hourString = "0" + "${timeOfDay.hour}";
  } else {
    hourString = "${timeOfDay.hour}";
  }

  String? minuteString;
  if(timeOfDay.minute < 10){
    minuteString = "0" + "${timeOfDay.minute}";
  } else {
    minuteString = "${timeOfDay.minute}";
  }

  //10:05   07:00
  return hourString + ":" + minuteString;
}