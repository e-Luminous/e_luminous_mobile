import 'dart:async';
import 'dart:io';

import 'package:eluminousmobile/constants/k_classroom_screen.dart';
import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/widgets/classroom_items.dart';
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
  var _isInit = true;
  var _isLoading = false;

  Future<void> _refreshClasses(BuildContext context) async {
    await Provider.of<Classrooms>(context, listen: false)
        .fetchAndSetClassroom();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Timer timer = new Timer(new Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<Classrooms>(context).classrooms;

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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              color: Colors.deepOrangeAccent,
              backgroundColor: Colors.black87,
              onRefresh: () => _refreshClasses(context),
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (ctx, index) => ClassroomItems(
                  id: classes[index].classroomId,
                  title: classes[index].classroomTitle,
                  section: classes[index].classroomSection,
                  accessCode: classes[index].accessCode,
                  enrolledTotal: classes[index].enrolledTotal,
                  shift: classes[index].classroomShift,
                ),
              ),
            ),
      drawer: Drawer(),
    );
  }
}
