class Administrator {
  int? id;
  String administratorid; //管理员编号
  String aname; //姓名
  String apassword; //密码

  Administrator(
      {required this.administratorid,
      required this.aname,
      required this.apassword});

  Administrator.fromMap(Map<String, dynamic> res)
      : administratorid = res["administratorid"],
        aname = res["aname"],
        apassword = res["apassword"];

  Map<String, Object?> toMap() {
    return {
      'administratorid': administratorid,
      'aname': aname,
      'apassword': apassword
    };
  }
}
