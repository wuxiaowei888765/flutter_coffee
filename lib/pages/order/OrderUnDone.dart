import 'package:flutter/material.dart';

class OrderUnDone extends StatefulWidget {
  @override
  _OrderUnDoneState createState() => _OrderUnDoneState();
}

class _OrderUnDoneState extends State<OrderUnDone> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: new Image.asset(
              "images/order_no.png",
              width: 150,
              height: 150,
            ),
          ),
         new Container(
           margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
           child:  new Text("您还没有订单哦"),
         ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: new RaisedButton(
              disabledColor: Color(0xffffffff),
              shape: Border.all(color: Color(0xff7EA7D1),style: BorderStyle.solid,width: 0.5),
              child: new Text("去喝一杯",
                  style: new TextStyle(color: Color(0xff7EA7D1),fontSize: 14)),
            ),
          )
        ],
      ),
    ));
  }
}
