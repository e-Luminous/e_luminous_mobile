import 'dart:async';
import 'dart:io';

import 'package:eluminousmobile/constants/k_classroom_screen.dart';
import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/screens/modify_classroom_screen.dart';
import 'package:eluminousmobile/widgets/classroom_items.dart';
import 'package:eluminousmobile/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

enum AppBarAction {
  Refresh,
  Feedback,
}

class ClassroomScreen extends StatefulWidget {
  static const routeName = '/classroom';
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

  void triggerProgressIndicator() {
    setState(() {
      _isLoading = true;
    });

    Timer timer = new Timer(new Duration(seconds: kMaxContentFetchingTime, milliseconds: 200), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      triggerProgressIndicator();
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
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(ModifyClassroomScreen.routeName);
            },
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
            onSelected: (value) {
              if (value == AppBarAction.Refresh) {
                triggerProgressIndicator();
              }
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 5.0,
              ),
            )
          : RefreshIndicator(
              backgroundColor: Colors.grey[800],
              color: Colors.orangeAccent,
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
      drawer: DrawerWidget(),
    );
  }
}
