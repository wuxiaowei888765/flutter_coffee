import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        title: new Text('购物车', style: new TextStyle(color: Color(0xff000000))),
      ),
      body: Stack(
        children: <Widget>[
          new Align(
            alignment: FractionalOffset.bottomCenter,
            child: new Container(
              height: 60,
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
                            "￥26",
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
                            style: new TextStyle(fontSize: 20,color: Color(0xffffffff)),
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
}
