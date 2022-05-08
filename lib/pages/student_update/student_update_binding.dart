import 'package:flutterrtest/pages/student_update/student_update_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class StudentUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentUpdateController>(StudentUpdateController());
  }
}
