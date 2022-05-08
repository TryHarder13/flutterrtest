import 'package:flutterrtest/pages/target/target_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class TargetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TargetController>(TargetController());
  }
}
