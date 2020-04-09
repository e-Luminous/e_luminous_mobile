import 'package:eluminousmobile/constants/k_classroom_screen.dart';
import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

enum AppBarAction {
  Refresh,
  Feedback,
}

class ClassroomScreen extends StatefulWidget {
  @override
  _ClassroomScreenState createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  @override
  Widget build(BuildContext context) {
    final classrooms = Provider.of<Classrooms>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'eLuminous',
          style: kAppBarTitleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.refresh,
                      color: Colors.deepOrangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Refresh'),
                  ],
                ),
                value: AppBarAction.Refresh,
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.all_inclusive,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Send Feedback'),
                  ],
                ),
                value: AppBarAction.Feedback,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (ctx, index) => ,
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
