import 'package:flutter/material.dart';
import 'package:pairings/views/edit_profile.dart';
import 'package:pairings/views/home.dart';
import 'package:pairings/views/loading.dart';
import 'package:pairings/views/signin.dart';
import 'package:pairings/views/signup.dart';

void main() {
  runApp(MaterialApp(
    //home: LoadingScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/signin': (context) => const SigninScreen(),
      '/signup': (context) => const SignupScreen(),
      '/edit' : (context) => const EditProfile(),
    },
  ));
}
