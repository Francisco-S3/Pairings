import 'package:flutter/material.dart';
import '../controllers/signup_controller.dart';
import '../models/utilities.dart';
import '../models/user.dart';
import '../config/globals.dart' as globals;


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  /// form controllers for new account form fields
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  late DateTime _date;
  String? dateAsString = 'Select Date';

  late bool passwordVisibility;
  late bool confirmVisibility;

  final _formState = GlobalKey<FormState> ();
  late User currentUser;
  bool response = false;
  String whoCalledMe = 'HomeScreen()';

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
    confirmVisibility = false;
    _date = DateTime(DateTime.now().year-21, DateTime.now().month, DateTime.now().day);
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
                      validator: (userFirstName) => validateName(userFirstName!)
                          ? null
                          : 'Error: not a valid name',
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
                      validator: (userLastName) => validateName(userLastName!)
                          ? null
                          : 'Error: not a valid name',
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
                      validator: (userPhone) => validatePhone(userPhone!)
                          ? null
                          : 'Error: not a valid phone number format',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Birthdate:  $dateAsString',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),

                        ElevatedButton(
                          child: const Text('Select'),
                          onPressed: () async {
                            DateTime? dateSelected = await showDatePicker(
                              context: context,
                              initialDate: _date,
                              firstDate: DateTime(1930),
                              lastDate: DateTime(DateTime.now().year),
                            );
                            if(dateSelected == null) {return;}
                            setState(() {
                              _date = dateSelected;
                              dateAsString = convertDate(_date);
                            });
                          },
                        ),
                      ],
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
                            // validate all form entries
                            if(_formState.currentState!.validate()) {
                              // pass to signup controller for new account creation
                              currentUser = User.partial(
                                email: _emailController.text,
                                password: _passwordController.text,
                                firstName: _fnameController.text,
                                lastName:  _lnameController.text,
                                phoneNum: _phoneController.text,
                                birthDate:  _date,
                              );

                              // TODO - delete after testing
                              print(currentUser.toString());

                              response = signupController(currentUser);
                              if(response) {
                                // confirm account created
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('New Account Created'),
                                  ),
                                );
                                setState(() {});

                                // return back to home screen
                                // TODO - replace with pop until 'whoCalledMe'
                                //Navigator.popUntil(context, ModalRoute.withName(whoCalledMe));
                                Navigator.of(context).pop();
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
