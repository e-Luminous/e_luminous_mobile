import 'dart:convert';

import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyClassroomScreen extends StatefulWidget {
  static const routeName = '/modify';

  @override
  _ModifyClassroomScreenState createState() => _ModifyClassroomScreenState();
}

class _ModifyClassroomScreenState extends State<ModifyClassroomScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit) {
      final selectedClassroomId =  ModalRoute.of(context).settings.arguments as int;
      if(selectedClassroomId != null) {
        final selectedClassroom = Provider.of<Classrooms>(context).findById(selectedClassroomId);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
            ],
          ),
        ),
      ),
    );
  }
}
