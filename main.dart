import 'package:flutter/material.dart';
import 'package:pairings/models/wine.dart';
import 'package:pairings/views/home.dart';
import 'package:pairings/views/loading.dart';
import 'package:pairings/views/signin.dart';
import 'package:pairings/views/wine_pairing.dart';
import 'package:pairings/views/search_wine.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/signin',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/search': (context) => SearchScreen(),
      '/pair': (context) => ChoosePairingScreen(),
      '/signin': (context) => SigninScreen(),
    },
  ));
}
