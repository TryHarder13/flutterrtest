import 'package:flutterrtest/pages/student_delete/student_delete_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class StudentDeleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentDeleteController>(StudentDeleteController());
  }
}
