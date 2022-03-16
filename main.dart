import 'package:flutter/material.dart';
import 'package:pairings/views/home.dart';
import 'package:pairings/views/loading.dart';
import 'package:pairings/views/signin.dart';
import 'package:pairings/views/signup.dart';
import 'package:pairings/views/create_profile.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/create',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/signin': (context) => SigninScreen(),
      '/signup': (context) => SignupScreen(),
      '/create': (context) => CreateProfile(),
    },
  ));
}
