import 'package:flutter/material.dart';

// utility function to confirm valid email format provided by user
bool validateEmail(String value) {
  String pattern1 = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String pattern2 = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern2);
  return (regex.hasMatch(value)) ? true : false;
}


// utility template for standard logo title
Container logoSection (String logo) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    child: const Image(image: AssetImage('assets/images/logo.png'),
    ),
  );
}