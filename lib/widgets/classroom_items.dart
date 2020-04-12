import 'dart:math';

import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/screens/modify_classroom_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassroomItems extends StatelessWidget {
  final int id;
  final String title;
  final String section;
  final String shift;
  final String accessCode;
  final int enrolledTotal;

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
    return Dismissible(
      key: ValueKey(id),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to remove from the classes?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {
        final message =
            Provider.of<Classrooms>(context, listen: false).removeClassroom(id);

        Scaffold.of(context).showSnackBar(
          new SnackBar(
            backgroundColor: Colors.black54,
            content: Row(
              children: <Widget>[
                Icon(Icons.delete_outline, color: Colors.deepOrangeAccent,),
                SizedBox(width: 10.0,),
                Text(
                  message,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        );
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 4.0,
        ),
      ),
      child: GestureDetector(
        onLongPress: () {
          Navigator.of(context).pushReplacementNamed(ModifyClassroomScreen.routeName, arguments: id);
        },
        child: Container(
          height: 180.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 10.0,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 184.0,
                margin: EdgeInsets.only(left: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Color(0xFF333366)
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 35.0,
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
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Icon(
                            shift == "Morning"
                                ? Icons.brightness_high
                                : Icons.brightness_6,
                            color: shift == "Morning"
                                ? Colors.orange[700]
                                : Colors.grey[800],
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "$shift",
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: shift == "Morning" ? 10.0 : 35.0,
                          ),
                          Icon(
                            Icons.group,
                            color: Colors.indigoAccent,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "Section - $section ($enrolledTotal)",
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.content_copy,
                              size: 20.0,
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "Code $accessCode",
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                alignment: FractionalOffset.centerLeft,
                child: Image(
                  image: AssetImage(
                      "assets/images/planet${new Random().nextInt(5)}.png"),
                  height: 108.0,
                  width: 108.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
