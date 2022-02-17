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
        title: const Text('Forgot Password'),
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
              Colors.black45,
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
              Text('Enter email address and we will send you a code to reset'),
            ],
          ),
        ),
      ),
    );
  }
}