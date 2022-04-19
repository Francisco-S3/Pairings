import 'package:flutter/material.dart';
import 'package:pairings/main.dart';
import 'package:pairings/views/home.dart';

import '../main.dart';

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
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              child: Image.asset(
                "./lib/assets/images/PairingsLogo.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 25,
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
