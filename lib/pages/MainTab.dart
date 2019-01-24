import 'package:flutter/material.dart';
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(1, 1, 0, 1),
                                child: Container(
                                  width: 43,
                                  height: 40,
                                  padding: EdgeInsets.fromLTRB(8, 6, 0, 0),
                                  decoration: new BoxDecoration(
                                    border: new Border.all(
                                        width: 1, color: Color(0xff7EA7D1)),
                                    color: Color(0xff7EA7D1),
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(20.0)),
                                  ),
                                  child: new Text(
                                    "自提",
                                    style: TextStyle(
                                        color: Color(0xffffffff), fontSize: 12),
                                  ),
                                ),
                              ),
                              Container(
                                width: 43,
                                height: 40,
                                padding: EdgeInsets.fromLTRB(6, 8, 0, 0),
                                child: new Text(
                                  "外送",
                                  style: TextStyle(
                                      color: Color(0xff7EA7D1), fontSize: 12),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                new Offstage(
                  offstage: false,
                  child: new Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: new Align(
                      alignment: FractionalOffset.bottomCenter,
                      child:
                          new Container(color: Color(0xff000000), height: 0.1),
                    ),
                  ),
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
