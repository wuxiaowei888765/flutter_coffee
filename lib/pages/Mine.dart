import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/MineListWidget.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: new Column(
          children: <Widget>[
            new Container(
              height: 200,
              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              color: Color(0xff5A433A),
               child: Row(
                 children: <Widget>[
                   new Image.asset("images/default_user_header.png",
                       width: 70.0, height: 70.0),
                   new Container(
                     margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                     child: Row(
                       children: <Widget>[
                         new Text(
                           "啃骨头的绅士",
                           style: new TextStyle(
                               color: Color(0xffffffff), fontSize: 18),
                         )
                       ],
                     ),
                   ),
                 ],
               ),
            ),
            new Row(
              children: <Widget>[

              ],
            ),
            new MineListWidget(path: "images/ico_my_header.png",title: "个人资料",showLine: false,),
            new MineListWidget(path: "images/coffee_warehouse.png",title: "咖啡钱包",showLine: false,),
            new MineListWidget(path: "images/coffee_coupon.png",title: "优惠券",showLine: false,),
            new MineListWidget(path: "images/fragment_mine_exchange_discount_icon.png",title: "兑换优惠",showLine: false,),
            new MineListWidget(path: "images/bill_manager.png",title: "发票管理",showLine: true,),
            new Container(
              height: 20,
              color: Color(0xffF7F7F7),
            ),
            new MineListWidget(path: "images/help_feedback.png",title: "帮助反馈",showLine: true,),
            new Container(
              color: Color(0xffF7F7F7),
            ),
          ],
        ),
      ),
//      image:new Image(image: )
    );
  }
}
