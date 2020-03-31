import 'package:flutter/material.dart';

final fBaseBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.centerRight,
    colors: [
      Colors.green[700],
      Colors.green[500],
      Colors.green[400],
    ],
  ),
);

const kHeaderTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50.0,
  fontFamily: 'Sans',
  fontWeight: FontWeight.bold,
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
  hintText: "E-Mail (Institutional)",
  hintStyle: TextStyle(
    color: Colors.grey[500],
    fontFamily: 'Sans',
    fontWeight: FontWeight.bold,
  ),
  border: InputBorder.none,
);

final fInputPasswordDecoration = InputDecoration(
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

final fSignInButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(50.0),
  gradient: LinearGradient(
    colors: [
      Colors.green[600],
      Colors.green[400],
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

const kSignInButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Sans',
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
