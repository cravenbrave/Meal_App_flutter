import 'package:flutter/material.dart';

const Color UMBlue = Color.fromRGBO(0, 39, 76, 1);
const Color UMYellow = Color.fromRGBO(255, 203, 5, 1);

ThemeData basicTheme() {
  return ThemeData(
    primarySwatch: Colors.amber,
    accentColor: UMYellow,
    canvasColor: Colors.white,
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
      bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      caption: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
    ),
  );
}