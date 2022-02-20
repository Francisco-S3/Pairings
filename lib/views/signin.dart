import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pairings/views/home.dart';
import 'package:pairings/views/signup.dart';
import 'package:pairings/models/utilities.dart';
import '../controllers/signinController.dart';
import 'forgot_password.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool passwordVisibility;
  final _formState = GlobalKey<FormState> ();
  late String _errorMessage;


  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
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
      body: Container(
        height: height,
        width: width,

        // background insertion
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit:  BoxFit.cover,
            image: Image.asset(
              'lib/assets/images/BackgroundImage1.jpg',
            ).image,
          ),
        ),

        // logo insertion
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 80, 0, 0),
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
                const SizedBox(height: 30.0),

                // header insertion
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: const Text('Welcome Back!',
                    style: TextStyle(
                      color: Colors.white,
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
                      enabledBorder: UnderlineInputBorder(
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
                      : 'Error: password length no sufficient';
                    },
                    keyboardType: TextInputType.text,
                    obscureText: !passwordVisibility,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: const TextStyle(color: Colors.white),

                      enabledBorder: const UnderlineInputBorder(
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

                // sign in button row insertion
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Forgot Password Text clicked ...');
                          //**** change navigation to reset password screen ****
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPwdScreen()));
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: 'Forgot password?',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 17.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),

                      ElevatedButton(
                        child: const Text('Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                          ),
                        ),
                        onPressed: () {
                          _formState.currentState?.validate();

                          // validate email provided is in the correct format
                          // String userEmailAddress = emailController.text;
                          // if(!validateEmail(userEmailAddress)) {
                          //   print('invalid email format entered ...');
                          //   // display error message
                          //   //exit
                          // }

                          // verify password meets minimum length of 6 characters
                          // String userPassword = passwordController.text;
                          // if(userPassword.length < 6) {
                          //   print('password length not acceptable...');
                          //   // display error message
                          //   // exit
                          // }

                          // **********************************************************************
                          // ******  ADD CALL TO DB SIGNIN VERIFICATION PROCEDURE CODE HERE  ******
                          // ***********************************************************************

                          // if(signinController(userEmailAddress, userPassword)) {
                          //    setState(() {
                          //       isLoading = true;
                          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
                          //    });
                          // }
                          // else {
                          //   print('error:=invalid email or password');
                          // }
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
                    const Text('Don\'t have an account?   ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white),
                    ),

                    GestureDetector(
                      onTap: () {
                        print('Create Account Text clicked ...');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Create Account',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                color: Colors.orange,
                              ),
                            ),
                          ],
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
    );
  }
}
