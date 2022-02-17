import 'package:flutter/material.dart';
import 'package:pairings/models/wine.dart';

// ChoosePairings Class
// Runs only when user chooses option to search for a wine to pair with a food


class ChoosePairingScreen extends StatefulWidget {

  @override
  _ChoosePairingScreenState createState() => _ChoosePairingScreenState();
}

class _ChoosePairingScreenState extends State<ChoosePairingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for Wine Pairing'),
        centerTitle: true,
      ),
      body: const Text('pairing screen'),
    );
  }
}