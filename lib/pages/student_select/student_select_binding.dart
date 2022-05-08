import 'package:flutterrtest/pages/student_select/student_select_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class StudentSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentSelectController>(StudentSelectController());
  }
}
