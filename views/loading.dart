import 'package:flutter/material.dart';
import 'package:pairings/views/home.dart';

// Load Screen Class
// Runs when app is initialized, displays logo screen while loading

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  
  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 60.0),
            Text('Pairings',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 60.0,
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