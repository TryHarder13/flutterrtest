///创建一个模型类来表示数据库中用户的数据。
///一个简单的数据模型将提供处理SQLite友好格式所需的方法，将其转换为Dart对象，可以在应用程序中使用。
///创建用户模型类是为了定义数据库中用户表所期望的属性
///DB中存储的是Map对象

class User {
  int? id;
  String name;
  int age;
  String email;

  User({this.id, required this.name, required this.age, required this.email});

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        age = res["age"],
        email = res["email"];

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age, 'email': email};
  }
}
