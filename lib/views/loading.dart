import 'package:flutter/material.dart';
import '../main.dart';
import '../config/theme.dart';

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
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
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
            const SizedBox(height: 25),
            const Text("Find your match.",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
