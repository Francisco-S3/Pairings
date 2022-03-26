import 'package:flutter/material.dart';
import 'package:pairings/views/home.dart';
import 'package:pairings/views/signin.dart';
import 'package:pairings/controllers/signup_controller.dart';
import 'package:pairings/models/utilities.dart';
import 'package:pairings/models/user.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // editing controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  DateTime _date = DateTime(DateTime.now().year-21, DateTime.now().month, DateTime.now().day);

  late bool passwordVisibility;
  late bool confirmVisibility;

  final _formState = GlobalKey<FormState> ();
  late User _currentUser;


  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
    confirmVisibility = false;
  }

  @override
  Widget build(BuildContext context) {

    // use relative sizes based on current media display
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account',
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
        height: _height,
        width: _width,

        // background insertion
        decoration: const BoxDecoration(
          color: Colors.black,
        ),

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
                  const SizedBox(height: 50.0),

                  // header insertion
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                    child: const Text('Let\'s Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),

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
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                      validator: (userEmailAddress) => validateEmail(userEmailAddress!)
                          ? null
                          : 'Error: not a valid email address',
                    ),
                  ),

                  // password login insertion
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: TextFormField (
                      controller: _passwordController,
                      validator: (password) {
                        return (password!.length > 5)
                            ? null
                            : 'Error: minimum password length is 6 characters';
                      },
                      keyboardType: TextInputType.text,
                      obscureText: !passwordVisibility,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
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

                  // repeat password login insertion
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: TextFormField (
                      controller: _confirmController,
                      validator: (confirmPassword) {
                        return (confirmPassword! == _passwordController.text)
                            ? null
                            : 'Error: Entry must match password';
                      },
                      keyboardType: TextInputType.text,
                      obscureText: !confirmVisibility,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'confirm password',
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
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

                  // first name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: TextFormField (
                      controller: _fnameController,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      enableSuggestions: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(Icons.account_circle, color: Colors.white,),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ),

                  // last name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: TextFormField (
                      controller: _lnameController,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      enableSuggestions: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(Icons.account_circle, color: Colors.white,),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ),

                  // phone number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: TextFormField (
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      enableSuggestions: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(Icons.phone, color: Colors.white,),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15.0),

                  // birthdate
                  Text('Birthdate:  $_date',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),

                  ElevatedButton(
                    child: const Text('Select birthdate'),
                    onPressed: () async {
                      DateTime? dateSelected = await showDatePicker(
                          context: context,
                          initialDate: _date,
                          firstDate: DateTime(1930),
                          lastDate: DateTime(DateTime.now().year),
                      );
                      if(dateSelected == null) {return;}
                      setState(() {_date = dateSelected;});
                      // TODO - remove this after testing
                      print(convertDate(_date));
                    },
                  ),

                  // vertical spacer box
                  const SizedBox(height: 5.0),

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
                            // validate email and password entries
                            if(_formState.currentState!.validate()) {
                              // pass to signup controller for authentication
                              _currentUser = signupController(_emailController.text, _passwordController.text);
                              if(_currentUser.id! > 0) {
                                // confirm account created
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('New Account Created'),
                                  ),
                                );
                                setState(() {});

                                // return back to home screen
                                Navigator.of(context).pop();
                              }
                              // invalid signup authentication, account already exists
                              else {
                                print('error:=account exists with that email address');
                                setState(() async {
                                  // alert user failed account creation
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Error!'),
                                      content: const Text(
                                        'New account NOT created.\n'
                                        'Email address already in use.'
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey[700],
                                            padding: const EdgeInsets.all(20.0),
                                          ),
                                          onPressed: () {Navigator.of(context).pop();},
                                            child: const Text('Close'),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              }
                            }
                          }
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
                            Navigator.of(context).pop();
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
    );
  }
}
