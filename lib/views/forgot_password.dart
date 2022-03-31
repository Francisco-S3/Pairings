import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/utilities.dart';
import '../controllers/resetPasswordController.dart';

// ForgotPwdScreen Class
// Runs only when user chooses option to reset password


class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({Key? key}) : super(key: key);

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  TextEditingController emailController = TextEditingController();
<<<<<<< HEAD:views/forgot_password.dart
  final _formState = GlobalKey<FormState> ();
=======
  final _formState = GlobalKey<FormState>();
  late String _errorMessage;
<<<<<<< Updated upstream:lib/views/forgot_password.dart
=======
>>>>>>> 7bb8534f5259709d36a1caf5924006dbb0658fd6:lib/views/forgot_password.dart
>>>>>>> Stashed changes:views/forgot_password.dart

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD:views/forgot_password.dart
        title: const Text('Forgot Password',
          style: TextStyle(color: Colors.white,
          //fontFamily: 'Rubik',
          //fontWeight: FontWeight.bold,
          fontSize: 24.0,
=======
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
<<<<<<< Updated upstream:lib/views/forgot_password.dart
=======
>>>>>>> 7bb8534f5259709d36a1caf5924006dbb0658fd6:lib/views/forgot_password.dart
>>>>>>> Stashed changes:views/forgot_password.dart
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
<<<<<<< Updated upstream:lib/views/forgot_password.dart
=======
<<<<<<< HEAD:views/forgot_password.dart
            color: Colors.black,
          ),
=======
>>>>>>> Stashed changes:views/forgot_password.dart
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black,
              ]),
        ),
>>>>>>> 7bb8534f5259709d36a1caf5924006dbb0658fd6:lib/views/forgot_password.dart
        child: Form(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                // vertical spacer box
                const SizedBox(height: 25.0),

                // email address field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'email address',
                    labelStyle: TextStyle(color: Colors.white),
<<<<<<< HEAD:views/forgot_password.dart
                    suffixIcon: Icon(Icons.email, color: Colors.white,),
=======
                    suffixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white, width: 2.0),
                    // ),
<<<<<<< Updated upstream:lib/views/forgot_password.dart
=======
>>>>>>> 7bb8534f5259709d36a1caf5924006dbb0658fd6:lib/views/forgot_password.dart
>>>>>>> Stashed changes:views/forgot_password.dart
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

                // vertical spacer box
                const SizedBox(height: 10.0),

                const Text('Please enter the email address associated with your account '
                    'in the box above and we will send you a code to recover your '
                    'password.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),

                // vertical spacer box
                const SizedBox(height: 25.0),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700],
                    padding: EdgeInsets.all(20.0),
                  ),
                  child: const Text('Send Recovery',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () async {
                    // optional - discuss with group
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('email address required!'),
                        ),
                      );
                      //return;
                    }

<<<<<<< Updated upstream:lib/views/forgot_password.dart
=======
<<<<<<< HEAD:views/forgot_password.dart
                    // verify valid email format submitted before proceeding
                    if(_formState.currentState!.validate()) {
                      String userEmailAddress = emailController.text;

                      // send request to database authentication
                      if(resetPasswordController(userEmailAddress)) {
                        // alert user password recovery success
=======
>>>>>>> Stashed changes:views/forgot_password.dart
                    // verify valid email format submitted
                    if (_formState.currentState!.validate()) {
                      print("ready to pass to forgotController");
                      String userEmailAddress = emailController.text;

                      // send request to database authentication
                      if (resetPasswordController(userEmailAddress)) {
<<<<<<< Updated upstream:lib/views/forgot_password.dart
=======
>>>>>>> 7bb8534f5259709d36a1caf5924006dbb0658fd6:lib/views/forgot_password.dart
>>>>>>> Stashed changes:views/forgot_password.dart
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Success!'),
                            content: const Text('Check your email for further recovery instructions'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                        Navigator.of(context).pop();
<<<<<<< Updated upstream:lib/views/forgot_password.dart
                      } else {
                        print('email address not valid');
=======
<<<<<<< HEAD:views/forgot_password.dart
                      }
                      else {
                        // alert user password recovery fail
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'Email address provided not found.\n'
                                'Review and try again.'
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[700],

                                  padding: const EdgeInsets.all(20.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
=======
                      } else {
                        print('email address not valid');
>>>>>>> 7bb8534f5259709d36a1caf5924006dbb0658fd6:lib/views/forgot_password.dart
>>>>>>> Stashed changes:views/forgot_password.dart
                      }
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}