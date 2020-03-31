import 'package:eluminousmobile/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eLuminous Mobile',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green[500],
      ),
      home: LoginScreen(),
    );
  }
}
