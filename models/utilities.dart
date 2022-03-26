import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


// utility function to confirm valid email format provided by user
bool validateEmail(String value) {
  //String pattern1 = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String pattern2 = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern2);
  return (regex.hasMatch(value)) ? true : false;
}


// utility to change the DateTime order from yyyy-mm-dd to mm-dd-yyyy
String? convertDate(DateTime _date) {
  var formatter = DateFormat('MM-dd-yyyy');
  return formatter.format(_date);
}


// utility to change DateTime object into string in format 'mm-dd-yyyy'
String convertDateTime( DateTime date) {
  String m = ((date.month < 10) ? "0" : "") + date.month.toString();
  String d = ((date.day < 10) ? "0" : "") + date.day.toString();
  return  m + "-" + d + "-" + date.year.toString();
}


// Widget buildDatePicker(DateTime _date) => Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
//   child: SizedBox(
//     height: 150,
//     child: CupertinoDatePicker(
//       backgroundColor: Colors.lightGreenAccent,
//       minimumYear: 1940,
//       maximumYear: DateTime.now().year - 21,
//       initialDateTime: _date,
//       mode: CupertinoDatePickerMode.date,
//       onDateTimeChanged: (date) =>
//           setState(() => _date = date),
//     ),
//   ),
// );