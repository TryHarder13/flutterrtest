import 'package:flutter/material.dart';
import 'package:flutterrtest/test/pageversion1/loginwidget/login_button.dart';
import 'package:flutterrtest/test/pageversion1/loginwidget/login_input.dart';

///主要解决页面销毁时，调用setState
abstract class FNetState<T extends StatefulWidget> extends State<T> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      print('页面已销毁');
    }
  }
}

bool isNotEmpty(String? text) {
  return text?.isNotEmpty ?? false;
}

bool isEmpty(String? text){
  return text?.isEmpty ?? false;
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends FNetState<LoginPage> {
  String? userName;
  String? passWord;
  bool loginEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
            children: [

              Positioned(
                  height: 220,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image(image: AssetImage('assets/images/project/images/ic_login.png'),fit: BoxFit.cover,),
                  ),
              ),
              Positioned.fill(
                  top: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: ListView(
                      children: [
                        LoginInput(
                          title: "用户名",
                          hint: "请输入用户名",
                          onChanged: (text) {
                            userName = text;
                            checkInput();
                          },
                        ),
                        LoginInput(
                          title: "密码",
                          hint: "请输入密码",
                          onChanged: (text) {
                            passWord = text;
                            checkInput();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                          child: LoginButton(
                            title: '登录',
                            enable: loginEnable,
                            //onPressed: sendLogin,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {

                              },
                              child: Text(
                                "注册",
                                style:
                                TextStyle(fontSize: 16, color: Colors.black26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
              ),
              Positioned(
                  top: 60,
                  left: 20,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
              ),
            ],
          ),
      ),
    );
  }

  ///检查用户名和密码是否为空等情况
  void checkInput() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(passWord)) {
      enable = true;
    } else {
      enable = false;
    }

    setState(() {
      loginEnable = enable;
      print('loginEnable = $loginEnable');
    });
  }

}
