import 'package:flutter/material.dart';

final fBaseBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.centerRight,
    colors: [
      Colors.deepPurple[800],
      Colors.deepPurple[700],
      Colors.deepPurple[600],
    ],
  ),
);

const kHeaderTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50.0,
  fontFamily: 'Righteous',
);

const kSubHeaderTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontFamily: 'Sans',
);

final fStackedBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(45.0),
    topRight: Radius.circular(45.0),
  ),
);

final fBaseOfInputsBoxDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: Colors.grey[200],
    ),
  ),
);

final fInputEmailDecoration = InputDecoration(
  icon: Icon(Icons.mail_outline),
  hintText: "E-Mail (Institutional)",
  hintStyle: TextStyle(
    color: Colors.grey[500],
    fontFamily: 'Sans',
    fontWeight: FontWeight.bold,
  ),
  border: InputBorder.none,
);

final fInputPasswordDecoration = InputDecoration(
  icon: Icon(Icons.vpn_key),
  hintText: "Password",
  hintStyle: TextStyle(
    color: Colors.grey[500],
    fontFamily: 'Sans',
    fontWeight: FontWeight.bold,
  ),
  border: InputBorder.none,
);

final fSecondaryButtonDecoration = TextStyle(
  color: Colors.grey[600],
  fontSize: 15.0,
  fontFamily: 'Sans',
  fontWeight: FontWeight.bold,
);


const kSignInButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Sans',
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
