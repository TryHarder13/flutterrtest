import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePageTabView extends StatefulWidget {
  final List<String>? tabIcons; //数组保留svg图片路径，几个元素就有几个按钮
  final Color? activeColor; //按钮选中颜色
  final Color? bgColor; //按钮的背景色
  final Function(int index)? onPress; //通知pageView切换页面
  int selectIndex;
  final List<String>? pageTabTitle;

  HomePageTabView({
    Key? key,
    @required this.tabIcons,
    this.activeColor = Colors.blue,
    this.bgColor = Colors.white,
    this.onPress,
    this.selectIndex = 0,
    this.pageTabTitle,
  })  : assert(tabIcons!.length <= 5),
        assert(selectIndex <= tabIcons!.length - 1),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageTabViewState();
  }
}
//
// class HomePageTabViewState extends State<HomePageTabView> {
//   List<Widget> _renderTabButtons() {
//     //下划线——private
//     //根据tabIcons的数量来构建相应的按钮个数
//     return widget.tabIcons!.asMap().keys.map<Widget>((index) {
//       String asset = widget.tabIcons![index]; //获取按钮图标的路径
//       return Container(
//         width: Get.width / widget.tabIcons!.length,
//         height: double.infinity,
//         color: widget.bgColor,
//         child: IconButton(
// highlightColor: Colors.transparent,
// splashColor: Colors.transparent,
//           icon: SvgPicture.asset(asset,
//               color: index == widget.selectIndex
//                   ? widget.activeColor
//                   : Colors.grey),
//           onPressed: () {
//
//           },
//         ),
//       );
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: _renderTabButtons(),
//       ),
//     );
//   }
// }

class HomePageTabViewState extends State<HomePageTabView> {
  List<Widget> _renderTabButtons() {
    //下划线——private
    //根据tabIcons的数量来构建相应的按钮个数
    return widget.tabIcons!.asMap().keys.map<Widget>((index) {
      String asset = widget.tabIcons![index]; //获取按钮图标的路径
      String message = widget.pageTabTitle![index];
      return Container(
        width: Get.width / widget.tabIcons!.length,
        height: double.infinity,
        color: widget.bgColor,
        child: Column(
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: SvgPicture.asset(asset,
                  color: index == widget.selectIndex
                      ? widget.activeColor
                      : Colors.grey),
              onPressed: () {
                if (index == widget.selectIndex) return;

                if (widget.onPress != null) {
                  widget.onPress!(index);
                }

                setState(() {
                  widget.selectIndex = index;
                });
              },
            ),
            Text(
              '${message}',
              style: TextStyle(
                  color: index == widget.selectIndex
                      ? widget.activeColor
                      : Colors.grey),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _renderTabButtons(),
      ),
    );
  }
}
