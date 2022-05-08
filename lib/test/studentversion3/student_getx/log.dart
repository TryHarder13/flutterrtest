import 'dart:async';

import 'package:flutter/material.dart';

class Log extends Dialog{

  timer(context)
  {
    var time=Timer.periodic(
        Duration(milliseconds: 1500),
            (t){
          // print('执行');
          Navigator.pop(context);
          t.cancel();
        }
    );

  }

  @override
  Widget build(BuildContext context) {

    timer(context);

    //自定义弹框内容
    return Material(

      type:MaterialType.transparency,
      child: Center(

          child:Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Text('学生登录成功'),
                          alignment:Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          // child: InkWell(
                          //   child: Icon(Icons.confirmation_number),
                          //   onTap: (){
                          //   },
                          // ),
                        ),

                      ],
                    )
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Text('欢迎',textAlign: TextAlign.center,),
                )
              ],
            ),
          )
      ),
    );
  }
}