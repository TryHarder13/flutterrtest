import 'package:flutterrtest/core/database/sql_manager.dart';
import 'package:sqflite/sqflite.dart';

///数据库表的操作基类

abstract class BaseTableProvider{

  String tableName(); //让子类实现,返回表名

  String createTableString(); //返回建表sql

  Future<Database> getDataBase() async{ //获取当前数据库对象
    bool isTableExit = await SqlManager.isTableExits(tableName());

    if(!isTableExit){
      //表不存在，则创建表
      Database db = await SqlManager.getCurrentDataBase();
      await db.execute(createTableString());
      return db;
    }else{
      return await SqlManager.getCurrentDataBase();
    }
  }

  Future<void> createTable() async {
    bool isTableExit = await SqlManager.isTableExits(tableName());
    if(!isTableExit){
      Database db = await SqlManager.getCurrentDataBase();
      await db.execute(createTableString());
    }
  }

}