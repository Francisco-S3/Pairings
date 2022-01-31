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
                fontFamily: 'GreatVibes',
                fontSize: 110.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: Image(image: AssetImage('assets/GrapeRevised.png'),
              ),
            ),
          ],
        ),
      ),
      );
  }
}

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: const Text('Pairings',
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'Satisfy',
//             fontWeight: FontWeight.bold,
//             fontSize: 36.0,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.grey,
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Image(
//           image: AssetImage('assets/GrapeIcon.jpg'),
//         ),
//       ),
//     );
//   }
// }