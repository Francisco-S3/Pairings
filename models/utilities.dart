import 'package:flutter/material.dart';

// utility function to confirm valid email format provided by user
bool validateEmail(String value) {
  String pattern1 = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String pattern2 = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern2);
  return (regex.hasMatch(value)) ? true : false;
}


// utility to change DateTime object into date string in format 'mm-dd-yyyy'
String convertDateTime( DateTime date) {
  String m = ((date.month < 10) ? "0" : "") + date.month.toString();
  String d = ((date.day < 10) ? "0" : "") + date.day.toString();
  return  m + "-" + d + "-" + date.year.toString();
}

// utility to reorder String 'mm-dd-yyyy' into DateTime format 'yyyymmdd'
String convertDateFormat( String date) {
  String m = date;
  String d = "03";
  String y = "2022";
  return  y + m.padLeft(2,"0") + d.padLeft(2,"0");
}
