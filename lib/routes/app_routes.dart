import 'package:flutterrtest/pages/home/home_binding.dart';
import 'package:flutterrtest/pages/home/home_page.dart';
import 'package:flutterrtest/pages/login/login_page.dart';
import 'package:flutterrtest/pages/mine/about.dart';
import 'package:flutterrtest/pages/other/picture/picture_data.dart';
import 'package:flutterrtest/pages/other/picture/picture_page.dart';
import 'package:flutterrtest/pages/splash/splash_binding.dart';
import 'package:flutterrtest/pages/splash/splash_page.dart';
import 'package:flutterrtest/pages/student_add/student_add_binding.dart';
import 'package:flutterrtest/pages/student_add/student_add_page.dart';
import 'package:flutterrtest/pages/student_delete/student_delete_binding.dart';
import 'package:flutterrtest/pages/student_delete/student_delete_page.dart';
import 'package:flutterrtest/pages/student_select/student_select_binding.dart';
import 'package:flutterrtest/pages/student_select/student_select_page.dart';
import 'package:flutterrtest/pages/student_update/edit/student_update_edit_binding.dart';
import 'package:flutterrtest/pages/student_update/student_update_binding.dart';
import 'package:flutterrtest/pages/student_update/edit/student_update_edit_page.dart';
import 'package:flutterrtest/pages/student_update/student_update_page.dart';
import 'package:flutterrtest/pages/target/target_binding.dart';
import 'package:flutterrtest/pages/target/target_page.dart';
import 'package:flutterrtest/pages/talk/contacts.dart';
import 'package:flutterrtest/pages/talk/talk_page.dart';
import 'package:get/get.dart';

///创建所有获取app路由的文件
abstract class AppPages {
  static final pages = [
    //闪屏页
    GetPage(name: Routes.SPLASH, page: () => SplashPage(),binding: SplashBinding()),
    
    //主页
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),

    //公示栏页面
    GetPage(name: Routes.TARGET, page: () => TargetPage(), binding: TargetBinding()),

    //学生信息添加页
    GetPage(name: Routes.STUDENTADD, page: () => StudentAddPage(), binding: StudentAddBinding()),

    //学生信息查询页
    GetPage(name: Routes.STUDENTSELECT, page: () => StudentSelectPage(), binding: StudentSelectBinding()),

    //学生信息修改页
    GetPage(name: Routes.STUDENTUPDATE, page: () => StudentUpdatePage(), binding: StudentUpdateBinding(),
      children:[GetPage(name: Routes.STUDENTUPDATEEDIT, page: () => StudentUpdateEditPage(), binding: StudentUpdateeditBinding()),]
    ),

    // //学生信息修改页
    // GetPage(name: Routes.STUDENTUPDATEEDIT, page: () => StudentUpdateEditPage(), binding: StudentUpdateBinding()),

    //学生信息删除页
    GetPage(name: Routes.STUDENTDELETE, page: () => StudentDeletePage(), binding: StudentDeleteBinding()),

    //联系人页
    GetPage(name: Routes.CONTACTS, page: () => ContactsList(),),

    //聊天页
    GetPage(name: Routes.TALK, page: () => TalkPage(),),

    //关于页
    GetPage(name: Routes.ABOUT, page: () => AboutPage(),),

    //登录页
    GetPage(name: Routes.LOGIN, page: () => LoginPage(),),

    //图片页
    GetPage(name: Routes.PICTURE, page: () => PetCard(data: petCardData),),
  ];
}

///命名路由的名称，定义静态常量
abstract class Routes {
  //初始化页面路由
  static const INETIAL = "/";
  
  //闪屏页路由
  static const SPLASH = "/splash"; 
  
  //主页路由
  static const HOME = "/home";

  //公示栏页面
  static const TARGET = "/target";

  //学生信息添加页面
  static const STUDENTADD = "/studentadd";

  //学生信息查询页面
  static const STUDENTSELECT = "/studentselect";

  //学生信息修改页面
  static const STUDENTUPDATE = "/studentupdate";

  //学生信息修改页面
  static const STUDENTUPDATEEDIT = "/studentupdateedit";

  //学生信息删除页面
  static const STUDENTDELETE = "/studentdelete";

  //联系人页面
  static const CONTACTS = "/contacts";

  //聊天页面
  static const TALK = "/talk";

  //关于页面
  static const ABOUT = "/about";

  //登录页面
  static const LOGIN = "/login";

  //摄影图片页面
  static const PICTURE = "/picture";
}
