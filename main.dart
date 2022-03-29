import 'package:flutter/material.dart';
import './views/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pairings',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primaryColor: Colors.black,
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 20),
              bodyText2: TextStyle(),
            ).apply(
              bodyColor: Colors.white,
            )),
        home: Loading());
  }
}
