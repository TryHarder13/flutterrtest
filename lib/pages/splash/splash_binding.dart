import 'package:flutterrtest/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

///binding：把controller注册到整个项目里面

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
