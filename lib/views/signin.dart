import 'package:flutter/material.dart';
import 'signup.dart';
import '../models/utilities.dart';
import '../controllers/signin_controller.dart';
import 'forgot_password.dart';
import '../config/globals.dart' as globals;


class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  /// form controllers for login fields
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  /// toggle password visibility in password fields
  late bool passwordVisibility;

  /// formState variable
  final _formState = GlobalKey<FormState> ();
  /// response from login controller
  bool response = false;

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {

    /// use relative sizes based on current media display
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In',
          style: TextStyle(color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30.0,
        ),
      ),
      body: Container(
        height: height,
        width: width,

        // background insertion
        decoration: const BoxDecoration(
          color: Colors.black,
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

                  // vertical spacer box
                  const SizedBox(height: 90.0),

                  // header insertion
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: const Text('Welcome Back!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),

                  // vertical spacer box
                  const SizedBox(height: 90.0),

                  // email login insertion
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    child: TextFormField (
                      controller: _emailController,
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
                      controller: _passwordController,
                      validator: (password) {
                        return (password!.length > 5)
                        ? null
                        : 'Error: password length not sufficient';
                      },
                      keyboardType: TextInputType.text,
                      obscureText: !passwordVisibility,
                      style: const TextStyle(color: Colors.white),
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
                  const SizedBox(height: 40.0),

                  // sign in button row insertion
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //**** change navigation to reset password screen ****
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPwdScreen()));
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: 'Forgot password?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[700],
                            padding: const EdgeInsets.all(20.0),
                          ),
                          child: const Text('Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 17.0,
                            ),
                          ),
                          onPressed: () async {
                            // validate email & password format before proceeding
                            if(_formState.currentState!.validate()) {

                              /// pass to signinController for authentication
                              response = signinController(_emailController.text, _passwordController.text);
                              if(response && globals.isLoggedIn) {
                                  // alert user confirmation of login
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Success!  Login completed.'),
                                    ),
                                  );
                                setState(() {
                                  // close login screen and return to home page
                                  Navigator.of(context, rootNavigator: true).pop();
                                });
                              }

                              // invalid login authentication, password/email don't match any account
                              else {
                                // alert user confirmation of login
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Login Error'),
                                    content: const Text(
                                      'Email or password is incorrect '
                                      'or the account is locked.\n'
                                      'Please try again or reset your password.'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey[700],
                                          padding: const EdgeInsets.all(20.0),
                                        ),
                                        onPressed: () {Navigator.of(context, rootNavigator: true).pop();},
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
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
                      const Text('Don\'t have an account?   ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
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
                                  color: Colors.white,
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
      ),
    );
  }
}
