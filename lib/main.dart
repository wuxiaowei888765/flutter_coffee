import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Mine.dart';
import 'package:flutter_app/pages/ShoppingCart.dart';
import './pages/MainTab.dart';
import './pages/ShopTab.dart';
import './pages/OrderList.dart';

void main(){
  runApp(
      new MaterialApp(
          title:'仿luckin',
          home:new HomePage()
      )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() =>new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  //Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController tabcontroller;
  var appBottomTitles = ['首页', '菜单', '订单', '购物车', '我的'];
  var tabImages;

  int _tabIndex = 0;

  //生命周期方法插入渲染树时调用，只调用一次
  @override
  void initState() {
    super.initState();
    tabcontroller = new TabController(
        length: appBottomTitles.length,   //Tab页的个数
        vsync: this //动画效果的异步处理，默认格式
    );

  }

  //生命周期方法构建Widget时调用
  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
        body: new TabBarView(
          controller: tabcontroller,
          physics: new NeverScrollableScrollPhysics(),
          children: <Widget>[
            new MainTab(),
            new ShopTab(),
            new OrderList(),
            new ShoppingCart(),
            new Mine(),
          ],
        ),
        bottomNavigationBar: new Material(
          //底部栏整体的颜色
          color: Colors.white,
          elevation: 0,
          child: new TabBar(
            indicatorColor:Colors.white,
            controller: tabcontroller,
            tabs: <Tab>[
              new Tab(text:appBottomTitles[0],icon: getTabIcon(0)),
              new Tab(text:appBottomTitles[1],icon: getTabIcon(1)),
              new Tab(text:appBottomTitles[2],icon: getTabIcon(2)),
              new Tab(text:appBottomTitles[3],icon: getTabIcon(3)),
              new Tab(text:appBottomTitles[4],icon: getTabIcon(4)),
            ],
            //tab被选中时的颜色，设置之后选中的时候，icon和text都会变色
            labelColor: Color(0xffAAA5B2),
            //tab未被选中时的颜色，设置之后选中的时候，icon和text都会变色
            unselectedLabelColor: Color(0xffAAA5B2),
            onTap: (index){
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        )
    );
  }

  //组件即将销毁时调用
  @override
  void dispose() {
    //释放内存，节省开销
    tabcontroller.dispose();
    super.dispose();
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 40.0, height: 40.0,fit: BoxFit.fill,);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void initData(){
    tabImages = [
      [
        getTabImage('images/icon_navigation_home_negative.png'),
        getTabImage('images/icon_navigation_home_active.png')
      ],
      [
        getTabImage('images/icon_navigation_drink_negative.png'),
        getTabImage('images/icon_navigation_drink_active.png')
      ],
      [
        getTabImage('images/icon_navigation_order_negative.png'),
        getTabImage('images/icon_navigation_order_active.png')
      ],
      [
        getTabImage('images/icon_navigation_shopping_cart_negative.png'),
        getTabImage('images/icon_navigation_shopping_cart_active.png')
      ],
      [
        getTabImage('images/icon_navigation_mine_negative.png'),
        getTabImage('images/icon_navigation_mine_active.png')
      ]
    ];
  }
}