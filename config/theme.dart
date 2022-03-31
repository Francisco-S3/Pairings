import "package:flutter/material.dart";


// function to provide an alternate color theme
Widget buildColorTheme(){

  return Theme(
    data: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orangeAccent,
    ),
    child: Container(),
  );
}


// function to provide a dark theme
Widget buildDarkTheme(){

  return Theme(
    data: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orangeAccent,
    ),
    child: Container(),
  );
}