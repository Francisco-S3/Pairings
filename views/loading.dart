import 'package:flutter/material.dart';
import './home.dart';

class Loading extends StatefulWidget {
  @override
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(title: "Pairings: Home")));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                // child: Image.asset("assets/images/GrapeIcon.png"),
                ),
            Container(
              child: Text("Find your match.", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
