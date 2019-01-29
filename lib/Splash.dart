import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';

void main() {
  runApp(new MaterialApp(title: '仿luckin', home: new Splash(),routes: <String, WidgetBuilder> {
    'HomePage': (BuildContext context) => HomePage(),
  },));
}

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Align(
            child: Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548697051486&di=e475f9d1a8f246dc7d943b5b62bff5df&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180730%2F15022142341e4179abfaf20bcb4ea4a4.jpeg",
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio,fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 40, 50),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, "HomePage",(router) => router == null);
                },
                child: RaisedButton(child: new Text("跳过")),
              ),
            ),
          )
        ],
    );
  }
}
