import 'dart:convert';

import 'package:eluminousmobile/constants/k_classroom_screen.dart';
import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/screens/classrooms_screen.dart';
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
      } else {
        _selectedClassroomMap['shift'] = "Morning";
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void saveForm() {
    final isValid = _form.currentState.validate();
    if(!isValid) { return; }
    _form.currentState.save();

    if(_selectedClassroomMap['id'] == -1) {
      Provider.of<Classrooms>(context, listen: false,).addClassroom(_selectedClassroomMap);
    } else {
      Provider.of<Classrooms>(context, listen: false,).updateClassroom(_selectedClassroomMap);
    }
    Navigator.of(context).pushReplacementNamed(ClassroomScreen.routeName);
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
            onPressed: saveForm,
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
                        _selectedClassroomMap['id'] == -1 ? 'Create Classroom' : 'Edit Classroom',
                        style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
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
                    picked: _selectedClassroomMap['shift'].toString(),
                    labelStyle: kSansRadio,
                    onSelected: (String selected) => setState((){
                      _selectedClassroomMap['shift'] = selected;
                    }),
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
