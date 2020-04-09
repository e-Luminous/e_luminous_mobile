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
    return Container();
  }
}
