import 'package:flutter/material.dart';
import 'package:pairings/wine.dart';
import 'package:pairings/screens/home.dart';
import 'package:pairings/screens/loading.dart';
import 'package:pairings/screens/choose_pairing.dart';
import 'package:pairings/screens/search_wine.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/search': (context) => SearchScreen(),
      '/pair': (context) => ChoosePairingScreen(),
    },
  ));
}
