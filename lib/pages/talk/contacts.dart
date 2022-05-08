import 'package:flutter/material.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/routes/app_routes.dart';
import 'package:get/get.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigatorBar(
        title: "联系人",
        closeCallBack: () {
          print("返回到首页");
          Get.back();
        },
      ),
      body: Center(child: _buildList()),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        _tile('宏洋', '85553333', Icons.adb_sharp),
        const Divider(),
        _tile('鸿蒙', '4294646416', Icons.theaters),
        const Divider(),
        _tile('利山和', '255546646', Icons.home),
        const Divider(),
        _tile('王志芳', '314646416', Icons.ac_unit_outlined),
        const Divider(),
        _tile('利勃海尔', '501646416', Icons.access_alarms),
        const Divider(),
        _tile('用罗浩', '135646416', Icons.task),
        const Divider(),
        _tile('黎莉莉', '7576416', Icons.restaurant),
        const Divider(),
        _tile('李宏利', '19234646416', Icons.title),
        const Divider(),
        _tile('维和先', '27246416', Icons.stream),
        const Divider(),
        _tile('兰利', '24646416', Icons.add_a_photo_outlined),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Get.toNamed(Routes.TALK);
      },
    );
  }
}
