import 'package:eluminousmobile/providers/classrooms.dart';
import 'package:eluminousmobile/screens/classrooms_screen.dart';
import 'package:eluminousmobile/screens/login_screen.dart';
import 'package:eluminousmobile/screens/modify_classroom_screen.dart';
import 'package:eluminousmobile/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Classrooms(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eLuminous Mobile',
        theme: ThemeData(
          primaryColor: Colors.deepPurple[700],
          accentColor: Colors.deepOrangeAccent,
        ),
        routes: {
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ModifyClassroomScreen.routeName: (ctx) => ModifyClassroomScreen(),
          ClassroomScreen.routeName: (ctx) => ClassroomScreen(),
        },
        home: ClassroomScreen(),
      ),
    );
  }
}
