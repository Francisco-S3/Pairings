import 'package:flutter/material.dart';

// Load Screen Class
// Runs when app is initialized, displays logo screen while loading

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


// **********************************************
// ******  ADD LOADING FUNCTION CODE HERE  ******
// **********************************************


class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('loading...'),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 60.0),
            Text('Pairings',
              style: TextStyle(
                fontFamily: 'Satisfy',
                fontSize: 100.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: Image(image: AssetImage('lib/assets/images/GrapeIcon.png'),
              ),
            ),
          ],
        ),
      ),
      );
  }
}