import 'package:eluminousmobile/models/classroom.dart';
import 'package:flutter/cupertino.dart';

class Classrooms with ChangeNotifier {
  /*
  ** @classrooms : a getter that returns the copied
  ** data from the list annotated as _classrooms from API
   */
  List<Classroom> get classrooms {
    return [..._classrooms];
  }

  List<Classroom> _classrooms = [
    Classroom(
      classroomId: 0,
      classroomTitle: 'Dhaka College (Physics)',
      classroomSection: 'A',
      classroomShift: 'Morning',
      accessCode: 'neqy71',
      enrolledTotal: 21,
    ),
    Classroom(
      classroomId: 0,
      classroomTitle: 'Dhaka College (Physics)',
      classroomSection: 'A',
      classroomShift: 'Morning',
      accessCode: '9xmHaq',
      enrolledTotal: 29,
    ),
  ];
}