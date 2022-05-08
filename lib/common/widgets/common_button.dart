import 'package:flutter/material.dart';

///登录、注册界面按钮
class CommonButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const CommonButton({Key? key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        height: 50,
        onPressed : null,
        disabledColor: Colors.blue.shade300,
        //color: Colors.blue,
        child: Text(
          title!,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
