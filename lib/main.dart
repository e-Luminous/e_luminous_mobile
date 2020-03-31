import 'package:eluminousmobile/screens/login_screen.dart';
import 'package:eluminousmobile/screens/registration_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eLuminous Mobile',
      theme: ThemeData(
        primaryColor: Colors.deepPurple[700],
        accentColor: Colors.deepOrangeAccent,
      ),
      routes: {
        RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
      home: RegistrationScreen(),
    );
  }
}
