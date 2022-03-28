import 'package:flutter/material.dart';
import 'views/edit_profile.dart';
import 'views/home.dart';
import 'views/loading.dart';
import 'views/signin.dart';
import 'views/signup.dart';

void main() {
  runApp(MaterialApp(
    //home: LoadingScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/signin': (context) => const SigninScreen(),
      '/signup': (context) => const SignupScreen(),
      '/edit': (context) => const EditProfile(),
    },
  ));
}
