import 'package:flutter/material.dart';
import 'package:flutter_app/pages/order/AllOrder.dart';
import 'package:flutter_app/pages/order/OrderDone.dart';
import 'package:flutter_app/pages/order/OrderUnDone.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

var tabTitle = ['全部', '未完成', '已完成'];

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xffffffff),
          title: new Text(
            '订单列表',
            style: new TextStyle(color: Color(0xff000000)),
          ),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(text: tabTitle[0]),
              new Tab(text: tabTitle[1]),
              new Tab(text: tabTitle[2]),
            ],
//            controller: _tabController,
            unselectedLabelColor: Color(0xff000000),
            labelColor: Color(0xff7EA7D1),
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new AllOrder(),
            new OrderUnDone(),
            new OrderDone(),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title});

  final String title;
}
