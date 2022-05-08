import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/models/target.dart';
import 'package:flutterrtest/pages/target/target_controller.dart';
import 'package:flutterrtest/pages/target/target_edit.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

///页面布局

class TargetPage extends StatelessWidget {
  final TargetController targetController = Get.find<TargetController>();

  Widget _renderTargetItem(Target? target, int index, BuildContext context) {
    if (target == null) return const SizedBox.shrink(); //创建一个尽可能小的长方体

    return InkWell(
      onTap: () {
        CupertinoScaffold.showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => TargetEditPage(target),
          enableDrag: true,
          expand: true,
          backgroundColor: Colors.transparent,
        );
      },
      child: Container(
        margin: EdgeInsets.only(
            top: index == 0 ? 30 : 15,
            left: 30,
            right: 30,
            bottom: index == targetController.targets.length - 1 ? 30 : 15),
        height: 80,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: target.targetColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        target.name ?? "",
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        target.description ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: CupertinoPageScaffold(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: NavigatorBar(
            title: "告示栏",
            closeCallBack: () {
              print("-------------wbbb");
              Get.back();
            },
          ),
          body: SafeArea(
            //引进了动感的ListView
            child: LiveList(
              showItemDuration:
                  const Duration(milliseconds: 200), //上一个展示200ms后下一个展示
              showItemInterval:
                  const Duration(milliseconds: 200), //用户不可见到展示出来的时间
              visibleFraction: 0.05,
              reAnimateOnVisibility: false,
              itemBuilder: ((context, index, animation) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: _renderTargetItem(
                        targetController.targets[index], index, context),
                  ),
                );
              }),
              itemCount: targetController.targets.length,
            ),
          ),
        ),
      ),
    );
  }
}
