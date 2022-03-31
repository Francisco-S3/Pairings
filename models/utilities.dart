import 'package:intl/intl.dart';


// utility function to confirm valid email format provided by user
bool validateEmail(String value) {
  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value)) ? true : false;
}


// utility function to confirm valid phone number format provided by user
bool validatePhone(String value) {
  String pattern = r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$";
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
String? convertDate(DateTime _date) {
  var formatter = DateFormat('MM-dd-yyyy');
  return formatter.format(_date);
}


// utility to change DateTime object into string in format 'mm-dd-yyyy'
String convertDateTime(DateTime date) {
  String m = ((date.month < 10) ? "0" : "") + date.month.toString();
  String d = ((date.day < 10) ? "0" : "") + date.day.toString();
  return  m + "-" + d + "-" + date.year.toString();
}
