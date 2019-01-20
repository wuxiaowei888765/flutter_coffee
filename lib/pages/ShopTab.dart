import 'package:flutter/material.dart';

class ShopTab extends StatefulWidget {
  @override
  _ShopTabState createState() => _ShopTabState();
}

var mainTitle = [
  "猜你喜欢",
  "人气TOP",
  "大师咖啡",
  "零度拿铁",
  "瑞纳冰",
  "经典饮品",
  "BOSS午餐",
  "健康轻食",
  "鲜榨果蔬汁"
];

class _ShopTabState extends State<ShopTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        brightness: Brightness.light,
        title:
            new Text('选择咖啡和小食', style: new TextStyle(color: Color(0xff000000))),
      ),
      body: new Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: 90,
            color: Color(0xffF7F7F7),
            child: ListView.builder(
                itemCount: mainTitle.length,
                itemBuilder: (BuildContext context, int position) {
                  return new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     new Container(
                       width: 140,
                       height: 60,
                       child:  new Stack(
                         children: <Widget>[
                           new Align(
                             alignment: FractionalOffset.center,
                             child: new Text(mainTitle[position]),
                           )
                         ],
                       ),
                     ),
                      new Container(
                        child: new Align(
                          child: new Container(color: Color(0xff000000), height: 0.1),
                        ),
                      ),
                    ],
                  );

                }),
          )
        ],
      ),
    );
  }
}
