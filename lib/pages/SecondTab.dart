import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        brightness: Brightness.light,
        title: new Text('选择咖啡和小食', style: new TextStyle(color: Color(0xff000000))),
      ),
      body: new Center(

      ),
    );
  }
}