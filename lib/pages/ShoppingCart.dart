import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

var cofferTitle = ['卡布奇诺纳锐冰', '抹茶拿铁', '摩卡', '榛果拿铁', '拿铁'];

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        brightness: Brightness.light,
        title: new Text('购物车', style: new TextStyle(color: Color(0xff000000))),
      ),
      body: Stack(
        children: <Widget>[
          new ListView.builder(
              itemCount: cofferTitle.length,
              itemBuilder: (BuildContext context, int position) {
                return getItem(position);
              }),
          new Align(
            alignment: FractionalOffset.bottomCenter,
            child: new Container(
              color: Color(0xffffffff),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    flex: 5,
                    child: new Container(
                      color: Color(0xffffff),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: new Text(
                              "应付合计：",
                              style: new TextStyle(fontSize: 12),
                            ),
                          ),
                          new Text(
                            "￥54",
                            style: new TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 2,
                    child: new Container(
                      color: Color(0xff7EA7D1),
                      height: 60,
                      child: new Align(
                        alignment: FractionalOffset.center,
                        child: new Text(
                          "去结算",
                          style: new TextStyle(
                              fontSize: 20, color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///ListView的item
  Container getItem(int position) {
    return new Container(
      color: Color(0xffffffff),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Align(
                      child: new Image.asset(
                        position%3==1?'images/icon_cb_pre.png':'images/icon_cb_nor.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(
                              cofferTitle[position],
                              style: new TextStyle(
                                  fontSize: 18, color: Color(0xff000000)),
                            ),
                            new Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              color: Color(0xffDE6E24),
                              child: new Text("充2赠1",
                                  style: new TextStyle(
                                      fontSize: 10, color: Color(0xffffffff))),
                            )
                          ],
                        ),
                        new Text(
                          "大/热",
                          style: new TextStyle(
                              fontSize: 10, color: Color(0xff000000)),
                        ),
                        new Text(
                          "仅限打包带走",
                          style: new TextStyle(
                              fontSize: 10, color: Color(0xff7EA7D1)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              new Align(
                child: new Container(
                  height: 60,
                  alignment: FractionalOffset.centerRight,
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: new Text("￥27",
                            style: new TextStyle(
                                fontSize: 16, color: Color(0xff000000))),
                      ),
                      new Align(
                        child: new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: new Image.asset(
                                    'images/coffeecool_sub_icon.png',
                                    width: 20,
                                    height: 20),
                              ),
                              new Text("1",
                                  style: new TextStyle(
                                      fontSize: 16, color: Color(0xff7EA7D1))),
                              new Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: new Image.asset(
                                  'images/coffeecool_add_icon.png',
                                  width: 20,
                                  height: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          new Offstage(
            offstage: false,
            child: new Container(
              margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Container(color: Color(0xff000000),height: 0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
