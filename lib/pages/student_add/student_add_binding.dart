import 'package:flutterrtest/pages/student_add/student_add_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class StudentAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentAddController>(StudentAddController());
  }
}
