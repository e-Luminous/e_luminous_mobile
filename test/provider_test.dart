import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('One Classroom Should Be Deleted, One Should Be Added', () {
    final classrooms = Classrooms();
    final initialLength = classrooms.classrooms.length;

    classrooms.removeClassroom(2);
    expect(classrooms.classrooms.length, initialLength - 1);

    Map _testingClassroom = {
      'id': 7,
      'code': '4xSD42',
      'enrolled': 0,
      'title': 'A testing classroom title',
      'section': 'A',
      'shift': 'Day',
    };
    classrooms.addClassroom(_testingClassroom);
    expect(classrooms.classrooms.length, initialLength);
  });
}
