import 'dart:async';
import 'dart:math';

import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/screens/modify_classroom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ClassroomItems extends StatefulWidget {
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
  _ClassroomItemsState createState() => _ClassroomItemsState();
}

class _ClassroomItemsState extends State<ClassroomItems> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animationController.repeat();
  }

  stopRotation(){
    animationController.stop();
  }

  startRotation(){
    animationController.repeat();
  }
  
  @override
  Widget build(BuildContext context) {
    stopRotation();

    return Dismissible(
      key: ValueKey(widget.id),
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
            Provider.of<Classrooms>(context, listen: false).removeClassroom(widget.id);

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
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                color: Colors.white,
                splashColor: Theme.of(context).accentColor,
                onLongPress: () {
                  startRotation();
                  Timer timer = new Timer(new Duration(seconds: 1, milliseconds: 300,), () {
                    Navigator.of(context).pushNamed(ModifyClassroomScreen.routeName, arguments: widget.id);
                  });
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(82.0, 16.0, 6.0, 16.0),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.title}",
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
                            widget.shift == "Morning"
                                ? Icons.brightness_high
                                : Icons.brightness_6,
                            color: widget.shift == "Morning"
                                ? Colors.orange[700]
                                : Colors.grey[800],
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "${widget.shift}",
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: widget.shift == "Morning" ? 10.0 : 35.0,
                          ),
                          Icon(
                            Icons.group,
                            color: Colors.indigoAccent,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "Section - ${widget.section} (${widget.enrolledTotal})",
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
                            "Code ${widget.accessCode}",
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
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              alignment: FractionalOffset.centerLeft,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget _widget) {
                  return Transform.rotate(
                    angle: animationController.value * 50.3,
                    child: _widget,
                  );
                },
                child: Container(
                  child: Image(
                    image: AssetImage(
                        "assets/images/planet${new Random().nextInt(5)}.png"),
                    height: 108.0,
                    width: 108.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
