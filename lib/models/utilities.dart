import 'package:intl/intl.dart';


/// Utility Functions
/// various helper functions used throughout the application


// utility function to confirm valid email format provided by user
bool validateEmail(String value) {
  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value)) ? true : false;
}


// utility function to confirm valid phone number format provided by user
bool validatePhone(String value) {
  //String pattern = r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$";
  String pattern = r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$";
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value)) ? true : false;
}


// utility function to confirm valid name format provided by user
bool validateName(String value) {
  String pattern = r"^[a-zA-Z'-]+$";
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value)) ? true : false;
}


// utility to change the DateTime order from yyyy-mm-dd to mm-dd-yyyy
String? reverseDate(DateTime date) {
  var formatter = DateFormat('MM-dd-yyyy');
  return formatter.format(date);
}


// utility to change DateTime object into string in format 'mm-dd-yyyy'
String convertDateTime(DateTime date) {
  String m = ((date.month < 10) ? "0" : "") + date.month.toString();
  String d = ((date.day < 10) ? "0" : "") + date.day.toString();
  return  m + "-" + d + "-" + date.year.toString();
}
