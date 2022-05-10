import 'package:flutterrtest/pages/student_update/edit/student_update_edit_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class StudentUpdateeditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentUpdateeditController>(StudentUpdateeditController());
  }
}
