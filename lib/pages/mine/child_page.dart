import 'package:flutter/material.dart';
class ChildPage extends StatelessWidget {
  final String title; ChildPage({this.title=""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(220, 220, 220, 1.0),
        title: Text('$title'),
      ),
      body: Center(
        child: Text('$title'),
      ),
    );
  }
}
