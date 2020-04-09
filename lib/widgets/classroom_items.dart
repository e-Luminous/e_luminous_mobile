import 'package:flutter/material.dart';

class ClassroomItems extends StatelessWidget {
  final int id;
  final String title;
  final String section;
  final String shift;
  final String accessCode;
  final double enrolledTotal;

  ClassroomItems({
    @required this.id,
    @required this.title,
    @required this.section,
    @required this.shift,
    @required this.accessCode,
    @required this.enrolledTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 10.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 164.0,
            margin: EdgeInsets.only(left: 30.0),
            decoration: BoxDecoration(
              color: Colors.white, // Color(0xFF333366)
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(82.0, 16.0, 6.0, 16.0),
              constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$title",
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Section - $section",
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            alignment: FractionalOffset.centerLeft,
            child: Image(
              image: AssetImage("assets/images/planet0.png"),
              height: 108.0,
              width: 108.0,
            ),
          ),
        ],
      ),
    );
  }
}
