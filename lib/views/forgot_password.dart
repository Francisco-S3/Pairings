import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pairings/models/utilities.dart';

// ForgotPwdScreen Class
// Runs only when user chooses option to reset password


class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({Key? key}) : super(key: key);

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  TextEditingController emailController = TextEditingController();
  final _formState = GlobalKey<FormState> ();
  late String _errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',
          style: TextStyle(color: Colors.white,
          fontFamily: 'Azonix',
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
            ]
          ),
        ),
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

              // vertical spacer box
              const SizedBox(height: 10.0),

              Text('Please enter the email address associated with your account '
                  'in the box above and we will send you a code to recover your '
                  'password.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),

              // vertical spacer box
              const SizedBox(height: 10.0),

              ElevatedButton(
                child: const Text('Send Recovery Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}