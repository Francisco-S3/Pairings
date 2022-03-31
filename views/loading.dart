import 'package:flutter/material.dart';
import 'home.dart';


// Load Screen Class
// Runs when app is initialized, displays logo screen while loading

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

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
   await Future.delayed(const Duration(seconds: 3), () {});
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {

    // use relative sizes based on current media display
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: const <Widget>[

              SizedBox(height: 10.0),

              Expanded(
                child: Image(image: AssetImage('lib/assets/images/PairingsLogo.png'),
                ),
              ),

              Text('Find Your Match',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30.0,
                ),
              ),

              SizedBox(height: 30.0),

            ],
          ),
        ),
      ),
      );
  }
}