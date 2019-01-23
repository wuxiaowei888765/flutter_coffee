import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/AzListView/az_common.dart';
import 'package:flutter_app/widgets/AzListView/az_listview.dart';

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

var allGoods = {
  "a": mainTitle,
  "b": mainTitle,
  "c": mainTitle,
  "d": mainTitle,
  "e": mainTitle,
  "f": mainTitle,
};
var pinned = true;
int _itemHeight = 100;
int _suspensionHeight = 40;
List<CoffeeInfo> _coffeeList = List();
var _suspensionTag = "猜你喜欢";

class _ShopTabState extends State<ShopTab> {
  @override
  void initState() {
    super.initState();
    getData();
  }

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
          new Expanded(
            flex: 2,
            child: new Container(
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
                          child: new Stack(
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
                            child: new Container(
                                color: Color(0xff000000), height: 0.1),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          new Expanded(
              flex: 6,
              child: new Container(
                child: AzListView(
                  data: _coffeeList,
                  showIndexHint: true,
                  itemHeight: 100,
                  itemBuilder: (context, model) => _buildListItem(model),
                  suspensionWidget: _buildSusWidget(_suspensionTag),
                  onSusTagChanged: _onSusTagChanged,
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildSusWidget(String susTag) {
    susTag = (susTag);
    return Container(
        height: _suspensionHeight.toDouble(),
        padding: const EdgeInsets.only(left: 15.0),
        color: Color(0xffffffff),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                '$susTag',
                softWrap: false,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: Color(0xff999999),
                height: 0.3,
              ),
            )
          ],
        ));
  }

  Widget _buildListItem(CoffeeInfo model) {
    String susTag = model.getSuspensionTag();
    susTag = (susTag);
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
            height: _itemHeight.toDouble(),
            child: Column(
              children: <Widget>[
                new Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Image.network(
                              "http://qcloud.dpfile.com/pc/ab0e71LQM3Gs9i56J7jf8qistszdLFp_4dQk7hM1I33JksWQ1f7oBWZsxm1DWgcauzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8twhW7bzr4O88Ivp4FuDG0SfCF2ubeXzk49OsGrXt_KYDCngOyCwZK-s3fqawWswzk.jpg",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child: new Text("${model.name}",
                                    style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Offstage(
                                  offstage: false,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                    child: new Text("大/单糖/热",
                                        style: new TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff999999))),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text("￥27",
                                          style: new TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Stack(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                child: Image.asset(
                                                    "images/coffeecool_add_icon.png",
                                                    width: 20,
                                                    height: 20),
                                              ))
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage : false,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    color: Color(0xff999999),
                    height: 0.2,
                  ),
                )
              ],
            ))
      ],
    );
  }

  void getData() {
    rootBundle.loadString('assets/data/Goods.json').then((value) {
      Map countyMap = json.decode(value);
      List list = countyMap['goods'];
      list.forEach((value) {
        _coffeeList
            .add(CoffeeInfo(name: value['name'], tagIndex: value['tagIndex']));
      });
    });
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }
}

class CoffeeInfo extends ISuspensionBean {
  String name;
  String tagIndex;

  CoffeeInfo({
    this.name,
    this.tagIndex,
  });

  CoffeeInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] == null ? "" : json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagIndex': tagIndex,
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}
