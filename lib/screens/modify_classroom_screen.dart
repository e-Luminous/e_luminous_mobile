import 'package:eluminousmobile/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class ModifyClassroomScreen extends StatefulWidget {
  static const routeName = '/modify';

  @override
  _ModifyClassroomScreenState createState() => _ModifyClassroomScreenState();
}

class _ModifyClassroomScreenState extends State<ModifyClassroomScreen> {
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
    );
  }
}
