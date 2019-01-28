import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets/Line.dart';

class MainItem extends StatelessWidget {

  final String chineseTile ;
  final String englishTile ;
  final String imagePath ;

  const MainItem({this.chineseTile,this.englishTile,this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(chineseTile,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  new Text(englishTile, style: TextStyle(fontSize: 14))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
        Line(
            showLine: false,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            color: Color(0xff000000),
            height: 0.1),
      ],
    );
  }
}
