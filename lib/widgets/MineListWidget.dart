import 'package:flutter/cupertino.dart';

class MineListWidget extends StatelessWidget {
  final String path;
  final String title;
  final bool showLine;

  const MineListWidget({@required this.path, @required this.title,@required this.showLine});

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Stack(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  alignment: FractionalOffset.centerRight,
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: new Image.asset(path, width: 45, height: 45),
                ),
                new Container(
                  alignment: FractionalOffset.centerRight,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: new Text(title, style: new TextStyle(fontSize: 16)),
                )
              ],
            ),
            new Align(
              child:new Container(
                height:60,
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                alignment: FractionalOffset.centerRight,
                child: new Image.asset('images/more_arrow2.png', width: 20, height: 20),
              )

            ),
          ],
        ),
        new Offstage(
          offstage: showLine,
          child: new Container(
            margin: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: new Align(
              alignment: FractionalOffset.bottomCenter,
              child: new Container(color: Color(0xff000000),height: 0.1),
            ),
          ),
        ),

      ],
    );
  }
}
