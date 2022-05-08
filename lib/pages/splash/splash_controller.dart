import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/models/illustration.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

///controller控制页面生命周期，是一个控制器

class SplashController extends GetxController {

  List<Illustration> illustrations = List.from(splashIllustrations);

  @override
  void onInit(){  //第一次初始化
    super.onInit();


  }

  @override
  void onReady() async{  //视图绘制成功后
    super.onReady();
    
    print("--------"+await getDatabasesPath());
  }

}
