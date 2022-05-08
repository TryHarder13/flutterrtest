import 'package:flutterrtest/core/database/providers/base_table_provider.dart';
import 'package:flutterrtest/models/note.dart';
import 'package:flutterrtest/utils/date_time.dart';
import 'package:flutterrtest/utils/util_object.dart';
import 'package:sqflite/sqflite.dart';

///id,关联的targetId，记录内容，创建时间

class NoteTableProvider extends BaseTableProvider {
  //表名
  final String tablename = "note";

  //表列名
  final String columnId = "id";
  final String columnTargetId = "target_id";
  final String columnNote = "note";
  final String columnCreateTime = "n_createtime";

  @override
  String createTableString() {
    return '''CREATE TABLE $tablename (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTargetId INTEGER NOT NULL,
      $columnNote TEXT NOT NULL,
      $columnCreateTime TEXT NOT NULL
    )
    ''';
  }

  @override
  String tableName() {
    return tablename;
  }

  //新增一条日记insert
  Future insertNote(Note note) async{
    Database db = await getDataBase();

    //该日记关键的目标TargetId
    int targetId = note.targetId!;

    //日记的内容
    String noteText = note.note!;

    //日记的创建时间
    String? createTime = formatTime(dateTime:note.createTime!);
    if(ObjectUtil.isEmptyString(createTime)) return;

    //执行插入操作，返回插入note的主键id值，用于程序的后续操作
    //开启一个数据库事务
    return await db.transaction((txn) async{
      int rowid = await txn.rawInsert(
        'INSERT INTO $tableName($columnTargetId,$columnNote,$columnCreateTime) VALUES($targetId,"$noteText","$createTime")'
      );
      return rowid;
    });

  }

  //查询某条目标下的所有日记select
  Future<List<Note>> queryNotesByTarget({required int targetId}) async {
    Database db = await getDataBase();

    String sql = "SELECT * FROM $tableName WHERE $columnTargetId = $targetId ORDER BY $columnCreateTime";

    List<Map<String, dynamic>> results = await db.rawQuery(sql);

    List<Note> notes = [];

    results.forEach((element) {
      Note? note = Note.noteForMap(element);
      if (note != null){
        notes.add(note);
      }
    });

    return notes;
  }
}

