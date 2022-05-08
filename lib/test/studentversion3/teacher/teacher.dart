class Teacher {
  int? id;
  String teacherid; //教师编号
  String tname; //姓名
  String tfaculty; //院系
  String tpassword; //密码

  Teacher(
      {required this.teacherid,
        required this.tname,
        required this.tfaculty,
        required this.tpassword});

  Teacher.fromMap(Map<String, dynamic> res)
      : teacherid = res["teacherid"],
        tname = res["tname"],
        tfaculty = res["tfaculty"],
        tpassword = res["tpassword"];

  Map<String, Object?> toMap() {
    return {
      'teacherid': teacherid,
      'tname': tname,
      'tfaculty': tfaculty,
      'tpassword': tpassword
    };
  }
}
