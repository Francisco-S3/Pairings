import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pairings/views/create_profile.dart';
import 'package:pairings/views/home.dart';
import 'package:pairings/views/signin.dart';
import '../controllers/signupController.dart';
import 'package:pairings/models/utilities.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  late bool passwordVisibility;
  late bool confirmVisibility;
  final _formState = GlobalKey<FormState> ();


  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
    confirmVisibility = false;
  }

  @override
  Widget build(BuildContext context) {

    // use relative sizes based on current media display
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,

          // background insertion
          decoration: const BoxDecoration(
            color: Colors.black,
            // image: DecorationImage(
            //   fit:  BoxFit.cover,
            //   image: Image.asset(
            //     'lib/assets/images/BackgroundImage2.jpg',
            //   ).image,
            //),
          ),

          // logo insertion
          child: Form(
            key: _formState,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/assets/images/logo.png',
                            width: 200,
                            height: 65,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ),

                    // vertical spacer box
                    const SizedBox(height: 60.0),

                    // header insertion
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: const Text('Let\'s Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),

                    // vertical spacer box
                    const SizedBox(height: 15.0),

                    // email login insertion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                      child: TextFormField (
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        enableSuggestions: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'email address',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(Icons.email, color: Colors.white,),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white, width: 2.0),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                        ),
                        validator: (userEmailAddress) => validateEmail(userEmailAddress!)
                            ? null
                            : 'Error: not a valid email address',
                      ),
                    ),

                    // vertical spacer box
                    const SizedBox(height: 25.0),

                    // password login insertion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                      child: TextFormField (
                        controller: passwordController,
                        validator: (password) {
                          return (password!.length > 5)
                              ? null
                              : 'Error: password must be at least 6 charactoers';
                        },
                        keyboardType: TextInputType.text,
                        obscureText: !passwordVisibility,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'password',
                          labelStyle: const TextStyle(color: Colors.white),
                          // enabledBorder: const UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white, width: 2.0),
                          // ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              passwordVisibility = !passwordVisibility;
                            }),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // vertical spacer box
                    const SizedBox(height: 25.0),

                    // repeat password login insertion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                      child: TextFormField (
                        controller: confirmController,
                        validator: (confirmPassword) {
                          return (confirmPassword! == passwordController.text)
                              ? null
                              : 'Error: Entry must match password';
                        },
                        keyboardType: TextInputType.text,
                        obscureText: !confirmVisibility,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'confirm password',
                          labelStyle: const TextStyle(color: Colors.white),
                          // enabledBorder: const UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white, width: 2.0),
                          // ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              confirmVisibility = !confirmVisibility;
                            }),
                            child: Icon(
                              confirmVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // vertical spacer box
                    const SizedBox(height: 25.0),
                    // sign in button row insertion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[700],
                              padding: const EdgeInsets.all(20.0),
                            ),
                            child: const Text('Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 17.0,
                              ),
                            ),
                            onPressed: () {
                              // validate email provided is in the correct format
                              // validate password is of sufficient length
                              // validate repeat password matches password
                              if(_formState.currentState!.validate()) {
                                print("ready to pass to signup controller");
                                String userEmailAddress = emailController.text;
                                String userPassword = passwordController.text;

                                // pass to signup controller for authentication
                                if(signupController(userEmailAddress, userPassword)) {
                                  setState(() {
                                    // close signup screen and return to home page
                                    //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
                                    print('signup successful');
                                    //**** change navigation to create profile screen ****
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProfile()));
                                  });
                                }
                                // invalid signup authentication, account already exists
                                else {
                                  print('error:=account exists with that email address');
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    // vertical spacer box
                    const SizedBox(height: 30.0),

                    // bottom text row insertion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?   ',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white),
                        ),

                        FocusTraversalOrder(
                          order: const NumericFocusOrder(5.0),
                          child: GestureDetector(
                            onTap: () {
                              print('Already have Account clicked ...');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()));
                            },
                            child: const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
