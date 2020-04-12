import 'dart:convert';

import 'package:eluminousmobile/constants/k_classroom_screen.dart';
import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

class ModifyClassroomScreen extends StatefulWidget {
  static const routeName = '/modify';

  @override
  _ModifyClassroomScreenState createState() => _ModifyClassroomScreenState();
}

class _ModifyClassroomScreenState extends State<ModifyClassroomScreen> {
  var _isInit = true;
  final _form = GlobalKey<FormState>();
  final _sectionFocusNode = FocusNode();

  Map _selectedClassroomMap = {
    'id': -1,
    'code': '',
    'enrolled': -1,
    'title': '',
    'section': '',
    'shift': '',
  };

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      final selectedClassroomId =
          ModalRoute.of(context).settings.arguments as int;
      if (selectedClassroomId != null) {
        final selectedClassroom =
            Provider.of<Classrooms>(context).findById(selectedClassroomId);

        _selectedClassroomMap['id'] = selectedClassroom.classroomId;
        _selectedClassroomMap['code'] = selectedClassroom.accessCode;
        _selectedClassroomMap['enrolled'] = selectedClassroom.enrolledTotal;
        _selectedClassroomMap['title'] = selectedClassroom.classroomTitle;
        _selectedClassroomMap['section'] = selectedClassroom.classroomSection;
        _selectedClassroomMap['shift'] = selectedClassroom.classroomShift;
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
      body: Card(
        color: Colors.white,
        margin: EdgeInsets.all(25.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Create Classroom',
                        style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: _selectedClassroomMap['title'],
                    decoration: InputDecoration(
                      labelText: 'Classroom Title',
                      labelStyle: kSansLabel,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please, provide a title';
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_sectionFocusNode);
                    },
                    onSaved: (value) {
                      _selectedClassroomMap['title'] = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: _selectedClassroomMap['section'],
                    focusNode: _sectionFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Section',
                      labelStyle: kSansLabel,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please, provide a section';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _selectedClassroomMap['section'] = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Shift',
                    style: kSansLabelTitle,
                  ),
                  RadioButtonGroup(
                    labels: <String>[
                      "Morning",
                      "Day",
                    ],
                    picked: _selectedClassroomMap['shift'].toString().isEmpty
                        ? "Morning"
                        : _selectedClassroomMap['shift'].toString(),
                    labelStyle: kSansRadio,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
