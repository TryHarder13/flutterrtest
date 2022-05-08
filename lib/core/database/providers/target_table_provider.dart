import 'package:flutterrtest/core/database/providers/base_table_provider.dart';
import 'package:flutterrtest/models/target.dart';
import 'package:flutterrtest/utils/date_time.dart';
import 'package:sqflite/sqflite.dart';

enum FilterType{
  all,//所有
  processing,//进行中
  completed,//已完成
  giveup, //放弃
}

class TargetTableProvider extends BaseTableProvider{

  final String tablename = "target";  //表名

  //表列名
  //自增id、名称、天数、颜色、声音、通知时间段、创建时间、删除时间、放弃时间
  final String columnId = "id";
  final String columnTargetName = "t_name";
  final String columnTargetDays ="t_days";
  final String columnTargetColors ="t_colors";
  final String columnTargetSoundKey ="t_sound_key";
  final String columnTargetNotificationTimes ="t_notification_time";
  final String columnTargetCreateTime ="t_createtime";
  final String columnTargetDeleteTime ="t_deletetime";
  final String columnTargetGiveUpTime ="t_giveuptime";

  @override
  String tableName() {
    return tablename;
  }

  @override
  String createTableString() {  //创建表的sql
    return '''CREATE TABLE $tablename (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTargetName TEXT NOT NULL,
      $columnTargetDays INTEGER NOT NULL,
      $columnTargetColors TEXT,
      $columnTargetSoundKey TEXT NOT NULL,
      $columnTargetNotificationTimes TEXT,
      $columnTargetCreateTime TEXT NOT NULL,
      $columnTargetDeleteTime TEXT,
      $columnTargetGiveUpTime TEXT
    )
    ''';
  }

  //新增一条目标 insert
  Future insertTarget(Target target) async {
    Database db = await getDataBase();

    String name = target.name!;
    int days = target.targetDays!;
    String? colors = target.targetColor == null
      ? null
      :"${target.targetColor!.red}|${target.targetColor!.green}|${target.targetColor!.blue}";

    String soundKey = target.soundKey!;

    String? notificationTimes;

    if(target.notificationTimes != null) {
      String times = "";
      for (int i = 0; i < target.notificationTimes!.length; i++) {
        //List<TimeOfDay>? notificationTimes;
        //将TimeOfDay对象转换成字符串
        times += timeOfDayToString(target.notificationTimes![i])!;
        if(i < target.notificationTimes!.length - 1){
          times += "|";
        }
      }
      notificationTimes = times;
    }

    DateTime now = DateTime.now();

    String nowString = formatTime(dateTime: now)!;

    return await db.transaction((txn) async{
      int rowid = await txn.rawInsert(
          'INSERT INTO $tableName($columnTargetName,$columnTargetDays,$columnTargetColors,$columnTargetSoundKey,$columnTargetNotificationTimes,$columnTargetCreateTime) VALUES($name,"$days","$colors","$soundKey","$notificationTimes","$nowString")'
      );
      return {'rowid': rowid, 'createTime': now};
    });
  }

  //查询所有目标 select
  Future<List<Target>> queryTargets({FilterType? filterType}) async {
    Database db = await getDataBase();

    String? sql;
    if(filterType != null && filterType == FilterType.giveup){
      //查询已放弃的目标
      sql = "SELECT * FROM $tablename WHERE $columnTargetGiveUpTime IS NOT NULL ORDER BY $columnTargetGiveUpTime DESC";
    } else if (filterType != null && (filterType == FilterType.processing || filterType == FilterType.completed)){
      //查询进行中或已完成
      sql = "SELECT * FROM $tablename WHERE $columnTargetGiveUpTime IS NULL ORDER BY $columnTargetCreateTime DESC";
    } else {
      //查询全部
      sql = "SELECT * FROM $tablename ORDER BY $columnTargetCreateTime DESC";
    }

    List<Map<String, dynamic>> results = await db.rawQuery(sql);

    List<Target> targets = [];

    results.forEach((element) {
      Target? target = Target.targetFromMap(element);
      if(target != null) {
        targets.add(target);
      }
    });

    return targets;
  }

  //修改目标 update
  Future updateTarget(Target target) async {
    //只能更新颜色，通知时间，声音
    Database db = await getDataBase();

    String? colors = target.targetColor == null
        ? null
        :"${target.targetColor!.red}|${target.targetColor!.green}|${target.targetColor!.blue}";
    String? notificationTimes;

    if (target.notificationTimes != null) {
      String times = "";
      for(int i = 0; i < target.notificationTimes!.length; i++){
        times += timeOfDayToString(target.notificationTimes![i])!;
        if(i < target.notificationTimes!.length - 1) {
          times += "|";
        }
      }
      notificationTimes = times;
    }

    String soundKey = target.soundKey!;

    return await db.transaction((txn) async {
      int count = await txn.rawUpdate(
        'UPDATE $tablename SET $columnTargetColors = ?, $columnTargetSoundKey = ?, $columnTargetNotificationTimes = ? WHERE $columnId = ?',
        [colors, soundKey, notificationTimes, target.id]
      );
      return count;
    });
  }

  //放弃某个目标
  Future giveupTarget(Target target) async {
    Database db = await getDataBase();

    String now = formatTime(dateTime: DateTime.now())!;

    return await db.transaction((txn) async {
      int count = await txn.rawUpdate(
        'UPDATE $tablename SET $columnTargetGiveUpTime = ? WHERE $columnId = ?',
        [now, target.id]
      );
      return count;
    });
  }
}


