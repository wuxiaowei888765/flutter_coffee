
import 'package:flutter/cupertino.dart';

class Line  extends StatelessWidget{
  final bool showLine ;
  final EdgeInsetsGeometry margin;
  final Color color;
  final double height;

  const Line({this.showLine,this.margin,this.color,this.height});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: showLine,
      child: new Container(
        margin: margin,
        child: new Align(
          alignment: FractionalOffset.bottomCenter,
          child: new Container(color: color,height: height),
        ),
      ),
    );
  }

}