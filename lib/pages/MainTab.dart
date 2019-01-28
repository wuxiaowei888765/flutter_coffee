import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Line.dart';
import 'package:flutter_app/widgets/MainItem.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

var images = [
  "http://5b0988e595225.cdn.sohucs.com/images/20181011/fb6d99724bec4859b89fc5b199d1e591.jpeg",
  "http://5b0988e595225.cdn.sohucs.com/images/20181011/270308f489644aceacd2d8c3f06a7490.jpeg",
  "http://5b0988e595225.cdn.sohucs.com/images/20181011/2722cf660fdc4254815a51b6f12cee67.jpeg"
];
var isClick = true;

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 300.0,
                child: Swiper(
                  itemBuilder: _swiperBuilder,
                  itemCount: images.length,
                  pagination: new SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    color: Colors.black54,
                    size: 5,
                    activeSize: 5,
                    activeColor: Colors.white,
                  )),
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                  onTap: (index) => print('点击了第$index个'),
                )),
            Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Column(
                          children: <Widget>[
                            Offstage(
                              offstage: !isClick,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "九都汇店",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text("距您187m", style: TextStyle(fontSize: 12))
                                ],
                              ),
                            ),
                            Offstage(
                              offstage: isClick,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "一个神秘而又变换莫测的地方",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text("13800138000 吴先生", style: TextStyle(fontSize: 10,color: Color(0xff7EA7D1))),
                                  Text("面价满￥55免费配送", style: TextStyle(fontSize: 10,color: Color(0xffDE6E24)))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Container(
                          width: 90,
                          height: 35,
                          decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 1, color: Color(0xff7EA7D1)),
                            color: Color(0xffffffff),
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(20.0)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (!isClick) {
                                      isClick = !isClick;
                                    }
                                  });

                                  ///todo 添加切换处理自提逻辑
                                  print("处理自提逻辑");
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                  child: Container(
                                    width: 42,
                                    height: 40,
                                    padding: EdgeInsets.fromLTRB(8, 6, 0, 0),
                                    decoration: new BoxDecoration(
                                      color: isClick
                                          ? Color(0xff7EA7D1)
                                          : Color(0xffffffff),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(20.0)),
                                    ),
                                    child: new Text(
                                      "自提",
                                      style: TextStyle(
                                          color: isClick
                                              ? Color(0xffffffff)
                                              : Color(0xff7EA7D1),
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isClick) {
                                      isClick = !isClick;
                                    }
                                  });

                                  ///todo 添加切换处理外送逻辑
                                  print("处理外送逻辑");
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                  child: Container(
                                    width: 42,
                                    height: 40,
                                    padding: EdgeInsets.fromLTRB(8, 6, 0, 0),
                                    decoration: new BoxDecoration(
                                      color: isClick
                                          ? Color(0xffffffff)
                                          : Color(0xff7EA7D1),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(20.0)),
                                    ),
                                    child: new Text(
                                      "外送",
                                      style: TextStyle(
                                          color: isClick
                                              ? Color(0xff7EA7D1)
                                              : Color(0xffffffff),
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                new Line(
                    showLine: false,
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    color: Color(0xff000000),
                    height: 0.1),
                MainItem(
                  chineseTile: "现在下单",
                  englishTile: "ORDER NOW",
                  imagePath: "icon_order_now_new.png",
                ),
                MainItem(
                  chineseTile: "咖啡钱包",
                  englishTile: "COFFEE WALLET",
                  imagePath: "icon_promo_new.png",
                ),
                MainItem(
                  chineseTile: "送TA咖啡",
                  englishTile: "SEND COFFEE",
                  imagePath: "icon_send_coffee_new.png",
                ),
                MainItem(
                  chineseTile: "企业账户",
                  englishTile: "ENTERPRISE ACCOUNT",
                  imagePath: "icon_enterprise_new.png",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      images[index],
      fit: BoxFit.fill,
    ));
  }
}
