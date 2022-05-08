class Student {
  int? id;
  String studentid; //学号
  String sname; //姓名
  String ssex; //性别
  int sage; //年龄
  String sfaculty; //院系
  String smajor; //专业
  int sclass; //班级
  String sphone; //电话
  String spassword; //密码

  Student(
      {this.id,
      required this.studentid,
      required this.sname,
      required this.ssex,
      required this.sage,
      required this.sfaculty,
      required this.smajor,
      required this.sclass,
      required this.sphone,
      required this.spassword});

  Student.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        studentid = res["studentid"],
        sname = res["sname"],
        ssex = res["ssex"],
        sage = res["sage"],
        sfaculty = res["sfaculty"],
        smajor = res["smajor"],
        sclass = res["sclass"],
        sphone = res["sphone"],
        spassword = res["spassword"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'studentid': studentid,
      'sname': sname,
      'ssex': ssex,
      'sage': sage,
      'sfaculty': sfaculty,
      'smajor': smajor,
      'sclass': sclass,
      'sphone': sphone,
      'spassword': spassword
    };
  }
}
