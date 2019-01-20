import 'package:flutter/material.dart';

class AllOrder extends StatefulWidget {
  @override
  _AllOrderState createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int position) {
            return getItem(position);
          }),
    );
  }

  Container getItem(int position) {
    return new Container(
      height: 140,
      color: Color(0xffffffff),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: new Stack(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: new Text("自提订单：33523665277157",
                        style: new TextStyle(color: Color(0xffB0B0B0))),
                  ),
                  new Align(
                    alignment: FractionalOffset.topRight,
                    child: new Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: new Text("已完成",
                          style: new TextStyle(color: Color(0xffB0B0B0))),
                    ),
                  )
                ],
              ),
              new Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: new Align(
                  child: new Container(color: Color(0xff000000), height: 0.1),
                ),
              ),
              new Stack(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: new Text(
                      "九都汇店（NO.1223）",
                      style: new TextStyle(fontSize: 16),
                    ),
                  ),
                  new Align(
                    alignment: FractionalOffset.topRight,
                    child: new Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: new Text("2019-01-19 14:52",
                          style: new TextStyle(color: Color(0xffB0B0B0))),
                    ),
                  )
                ],
              ),
              new Column(
                children: <Widget>[
                  new Align(
                    alignment: FractionalOffset.topLeft,
                    child: new Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: new Text(
                        "卡布奇诺等  共1件商品",
                        style: new TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  new Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: new Text("￥6.72"),
                        ),
                        new Align(
                          alignment: FractionalOffset.topRight,
                          child: new Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new RaisedButton(
                              color: Color(0xffffffff),
                              disabledColor: Color(0xffffffff),
                              shape: Border.all(color: Color(0xffEEEEEE),style: BorderStyle.solid,width: 1),
                              child: new Text("再来一单",
                                  style: new TextStyle(color: Color(0xff393939),fontSize: 14)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
