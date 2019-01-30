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

var pinned = true;
int _itemHeight = 100;
int _suspensionHeight = 40;
List<CoffeeInfo> _coffeeList = List();
var _suspensionTag = "猜你喜欢";
var selectItem = 0;

class _ShopTabState extends State<ShopTab> {
  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
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
              color: Color(0xffF7F7F7),
              child: ListView.builder(
                  itemCount: mainTitle.length,
                  itemBuilder: (BuildContext context, int position) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectItem = position;
                        });
                      },
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            color: selectItem == position
                                ? Color(0xffffffff)
                                : Color(0xfff7f7f7),
                            height: 50,
                            child: new Stack(
                              children: <Widget>[
                                new Align(
                                  alignment: FractionalOffset.center,
                                  child: new Text(mainTitle[position]),
                                )
                              ],
                            ),
                          ),
                          Offstage(
                            offstage: (position == mainTitle.length - 1)
                                ? true
                                : false,
                            child: Container(
                              child: Align(
                                child: Container(
                                    color: Color(0xffeeeeee), height: 0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          new Expanded(
              flex: 6,
              child: new Container(
                child: AzListView(
                  data: _coffeeList,
                  showIndexHint: false,
                  itemHeight: 100,
                  itemBuilder: (context, model, position) =>
                      _buildListItem(model, position, context),
                  suspensionWidget: _buildSusWidget(_suspensionTag),
                  onSusTagChanged: _onSusTagChanged,
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildSusWidget(String susTag) {
    return Container(
        height: _suspensionHeight.toDouble(),
        padding: const EdgeInsets.only(left: 15.0),
        color: Color(0xffffffff),
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
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
              flex: 6,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                color: Color(0xff999999),
                height: 0.3,
              ),
            )
          ],
        ));
  }

  Widget _buildListItem(CoffeeInfo model, int position, BuildContext context) {
    String susTag = model.getSuspensionTag();
    susTag = (susTag);
    return new GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: dialogContent(),
                contentPadding:EdgeInsets.fromLTRB(0, 0, 0, 0)
                ));
      },
      child: Column(
        children: <Widget>[
          Offstage(
            offstage: model.isShowSuspension != true,
            child: _buildSusWidget(susTag),
          ),
          SizedBox(
              height: _itemHeight.toDouble(),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Image.network(
                              "http://qcloud.dpfile.com/pc/dUyMrA_aI2EGL41dGvP41CBfJnFEGsdPQE61AVc0CntaPK-u1xGv2EDOXo9h_4jRuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8twhW7bzr4O88Ivp4FuDG0SfCF2ubeXzk49OsGrXt_KYDCngOyCwZK-s3fqawWswzk.jpg",
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
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text("￥27",
                                          style: new TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Stack(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    130, 0, 10, 0),
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
                  Offstage(
                    offstage: false,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      color: Color(0xff999999),
                      height: 0.1,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void getData() {
    rootBundle.loadString('assets/data/Goods.json').then((value) {
      Map countyMap = json.decode(value);
      List list = countyMap['goods'];
      setState(() {
        _coffeeList.clear();
        list.forEach((value) {
          _coffeeList.add(
              CoffeeInfo(name: value['name'], tagIndex: value['tagIndex']));
        });
      });
    });
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }

  Container dialogContent(){
    return new Container(
        width: double.maxFinite,
        height: 500,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: Stack(
              children: <Widget>[
                Image.network("http://qcloud.dpfile.com/pc/dUyMrA_aI2EGL41dGvP41CBfJnFEGsdPQE61AVc0CntaPK-u1xGv2EDOXo9h_4jRuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8twhW7bzr4O88Ivp4FuDG0SfCF2ubeXzk49OsGrXt_KYDCngOyCwZK-s3fqawWswzk.jpg",
                  width: double.maxFinite,height: 150,fit: BoxFit.fitWidth,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 20),child: Text("圣诞姜饼人拿铁",style: TextStyle(fontSize: 18,color: Color(0xffffffff)),),)
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap:(){
                      Navigator.of(context).pop();
                    },
                    child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child: Image.asset("images/update_close_bt.png",width: 20,height: 20,),),
                  )
                )
              ],
            ),
          ),
          Container(
            height: 200,
            child: CustomScrollView(
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate(
                      <Widget>[
                        Row(
                          children: <Widget>[
                            Text("规格",style: new TextStyle(fontSize: 14)),
                            Container(
                              height: 25,
                              width: 60,
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              decoration: new BoxDecoration(
                                border: new Border.all(
                                    width: 1, color: Color(0xffCEC0B4)),
                                color: Color(0xffCEC0B4),
                                borderRadius:
                                new BorderRadius.all(new Radius.circular(20.0)),
                              ),
                              child: Center(
                                child: Text("大",style: new TextStyle(color: Color(0xffffffff),fontSize: 12),),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Text("温度",style: new TextStyle(fontSize: 14)),
                              Container(
                                height: 25,
                                width: 60,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: new BoxDecoration(
                                  border: new Border.all(
                                      width: 1, color: Color(0xffCEC0B4)),
                                  color: Color(0xffCEC0B4),
                                  borderRadius:
                                  new BorderRadius.all(new Radius.circular(20.0)),
                                ),
                                child: Center(
                                  child: Text("冰",style: new TextStyle(color: Color(0xffffffff),fontSize: 12),),
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 60,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: new BoxDecoration(
                                  border: new Border.all(
                                      width: 1, color: Color(0xffCEC0B4)),
                                  color: Color(0xffffffff),
                                  borderRadius:
                                  new BorderRadius.all(new Radius.circular(20.0)),
                                ),
                                child: Center(
                                  child: Text("热",style: new TextStyle(color: Color(0xffCEC0B4),fontSize: 12),),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Text("糖度",style: new TextStyle(fontSize: 14)),
                              Container(
                                height: 25,
                                width: 60,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: new BoxDecoration(
                                  border: new Border.all(
                                      width: 1, color: Color(0xffCEC0B4)),
                                  color: Color(0xffCEC0B4),
                                  borderRadius:
                                  new BorderRadius.all(new Radius.circular(20.0)),
                                ),
                                child: Center(
                                  child: Text("单糖",style: new TextStyle(color: Color(0xffffffff),fontSize: 12),),
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 60,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                decoration: new BoxDecoration(
                                  border: new Border.all(
                                      width: 1, color: Color(0xffCEC0B4)),
                                  color: Color(0xffffffff),
                                  borderRadius:
                                  new BorderRadius.all(new Radius.circular(20.0)),
                                ),
                                child: Center(
                                  child: Text("半塘",style: new TextStyle(color: Color(0xffCEC0B4),fontSize: 12),),
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 61,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Offstage(
                  offstage: false,
                  child: new Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: new Container(color: Color(0xff000000),height: 0.1),
                    ),
                  ),
                ),
                new Stack(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    "￥27",
                                    style: new TextStyle(
                                        fontSize: 18, color: Color(0xff000000)),
                                  ),
                                ],
                              ),
                              new Text(
                                "拿铁￥27+默认奶油￥0",
                                style: new TextStyle(
                                    fontSize: 10, color: Color(0xff000000)),
                              ),
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
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: new Container(color: Color(0xff000000),height: 0.1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
