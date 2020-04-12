import 'dart:io';

import 'package:eluminousmobile/models/classroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';

class Classrooms with ChangeNotifier {
  /*
  ** @classrooms : a getter that returns the copied
  ** data from the list annotated as _classrooms from API
   */
  List<Classroom> get classrooms {
    // Copy and sort by descending
    final baseClasses = [..._classrooms];
    baseClasses.sort((b, a) => a.classroomId.compareTo(b.classroomId));
    return baseClasses;
  }

  Classroom findById(int id) {
    return _classrooms.firstWhere((classroom) => classroom.classroomId == id);
  }

  Future<void> fetchAndSetClassroom() async {
    var classes = [...classrooms];
    notifyListeners();
  }

  void addClassroom(Map filteredClassroom) {
    try {
      final indexToSet = _classrooms.length;
      final accessCodeToSet = randomAlphaNumeric(6);
      final enrolledStudentToSet = 0;

      final classroom = Classroom(
        classroomId: indexToSet,
        accessCode: accessCodeToSet,
        enrolledTotal: enrolledStudentToSet,
        classroomShift: filteredClassroom['shift'],
        classroomSection: filteredClassroom['section'],
        classroomTitle: filteredClassroom['title'],
      );

      _classrooms.add(classroom);
      notifyListeners();
    } catch (errorValue) {
      print(errorValue);
    }
  }

  void updateClassroom(Map filteredClassroom) {
    try {
      final classroomId = _classrooms
          .firstWhere((c) => c.classroomId == filteredClassroom['id']).classroomId;

      final updatedClassroom = Classroom(
        classroomId: classroomId,
        classroomTitle: filteredClassroom['title'],
        classroomSection: filteredClassroom['section'],
        classroomShift: filteredClassroom['shift'],
        enrolledTotal: filteredClassroom['enrolled'],
        accessCode: filteredClassroom['code'],
      );

      _classrooms[classroomId] = updatedClassroom;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  String removeClassroom(int classroomId) {
    var message = "Class deleted successfully";
    try {
      _classrooms.removeWhere((c) => c.classroomId == classroomId);
    } catch (exception) {
      message = "Deletion unsuccessful";
    }
    notifyListeners();
    return message;
  }

  List<Classroom> _classrooms = [
    Classroom(
      classroomId: 0,
      classroomTitle: 'Dhaka College (HSC): Physics-I',
      classroomSection: 'A',
      classroomShift: 'Morning',
      accessCode: 'neqy71',
      enrolledTotal: 21,
    ),
    Classroom(
      classroomId: 1,
      classroomTitle: 'Govt. Science College: Physics-II',
      classroomSection: 'B',
      classroomShift: 'Day',
      accessCode: '9xmHaq',
      enrolledTotal: 29,
    ),
    Classroom(
      classroomId: 2,
      classroomTitle: 'Dhaka Residential: Physics-II',
      classroomSection: 'F',
      classroomShift: 'Day',
      accessCode: 'S5f1f5',
      enrolledTotal: 33,
    ),
    Classroom(
      classroomId: 3,
      classroomTitle: 'City College: Physics-I',
      classroomSection: 'B',
      classroomShift: 'Day',
      accessCode: 'Dxd54d',
      enrolledTotal: 70,
    ),
    Classroom(
      classroomId: 4,
      classroomTitle: 'Holy Cross College: Physics-I',
      classroomSection: 'A',
      classroomShift: 'Morning',
      accessCode: 'es4Q8s',
      enrolledTotal: 65,
    ),
    Classroom(
      classroomId: 5,
      classroomTitle: 'Scholastica: Physics-I',
      classroomSection: 'C',
      classroomShift: 'Morning',
      accessCode: '45d56x',
      enrolledTotal: 65,
    ),
  ];
}
