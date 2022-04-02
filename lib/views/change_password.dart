import 'package:flutter/material.dart';
import '../models/user.dart';
import '../config/globals.dart' as globals;
import '../controllers/change_password_controller.dart';


// Change Password Class
// Runs only when user chooses option to change password

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final _formState = GlobalKey<FormState> ();

  @override
  void initState() {
    super.initState();
  }

  // TODO - *********** IMPORTANT ********************
  // TODO - remove this code once create account is operational
  User currentUser = User.partial(
  email: 'test@test.com',
  password: 'password',
  firstName: 'firstName',
  lastName: 'lastName',
  phoneNum: '336-555-1212',
  birthDate: DateTime(2000),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password',
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.black,
          ),
        child: Form(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [

                // vertical spacer box
                const SizedBox(height: 45.0),

                // current password field
                TextFormField(
                  controller: oldController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Old Password',
                    hintText: 'Enter your existing password',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.lock, color: Colors.white,),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                  validator: (oldPassword) => (oldPassword! == globals.currentUser.password)
                      ? null
                      : 'Error: password entered doesn\'t match current',
                ),

                // vertical spacer box
                const SizedBox(height: 20.0),

                // new password field
                TextFormField(
                  controller: newController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    hintText: 'Enter your new password',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.lock, color: Colors.white,),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                  validator: (password) => (password!.length > 5 &&
                      password != globals.currentUser.password)
                      ? null
                      : 'Error: new password must be different and at least 6 characters',
                ),

                // vertical spacer box
                const SizedBox(height: 20.0),

                // confirm password field
                TextFormField(
                  controller: confirmController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Password',
                    hintText: 'Enter your new password',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.lock, color: Colors.white,),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                  validator: (password) => password == newController.text
                      ? null
                      : 'Error: conrim password doesn\'t match',
                ),

                // vertical spacer box
                const SizedBox(height: 45.0),

                // change password button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700],
                    padding: const EdgeInsets.all(20.0),
                  ),
                  child: const Text('Change Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () async {
                    // verify user input before proceeding
                    _formState.currentState!.validate();
                    if (oldController.text.isEmpty || newController.text.isEmpty || confirmController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All fields required to change password'),
                        ),
                      );
                    }

                    // verify valid email format submitted before proceeding
                    if(_formState.currentState!.validate()) {

                      // TODO - send new password to controller to verify change

                      // send request to database authentication
                      if(changePasswordController(newController.text)) {
                        // alert user password recovery success
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Success!'),
                            content: const Text('Password has been updated'),
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
                        Navigator.of(context).pop();
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