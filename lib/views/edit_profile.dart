import 'package:flutter/material.dart';
import 'package:pairings/controllers/profile_controller.dart';
import 'home.dart';
import '../models/utilities.dart';
import '../models/user.dart';
import 'change_password.dart';
import '../config/globals.dart' as globals;


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  // birthDate variables
  late DateTime _date;
  late String? dateAsString;

  late User tempUser;
  late bool passwordVisibility;
  final _formState = GlobalKey<FormState> ();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // initialize local variable with currentUser information here
    if(globals.isLoggedIn) {
      tempUser = globals.currentUser;
      fnameController.text=tempUser.firstName;
      lnameController.text=tempUser.lastName;
      phoneController.text=tempUser.phoneNum;
      _date = tempUser.birthDate;
    }
    else {
      // TODO - ******************************************
      // TODO - ******************************************
      // TODO - ******************************************
      // TODO - *********** IMPORTANT ********************
      // TODO - need to address null error here
      tempUser = User.partial(
          email: 'ERROR@EE.US',
          password: 'password',
          firstName: 'firstERROR',
          lastName: 'lastERROR',
          phoneNum: '317-555-1212',
          birthDate: DateTime(2000),
      );
      _date = DateTime(DateTime.now().year-21, DateTime.now().month, DateTime.now().day);
    }
    dateAsString = convertDateTime(tempUser.birthDate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile',
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
              padding: const EdgeInsetsDirectional.fromSTEB(40, 40, 40, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // first name
                    const Text('Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField (
                      controller: fnameController,
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
                        suffixIcon: Icon(Icons.person, color: Colors.white,),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 15.0),

                    // last name
                    TextFormField (
                      controller: lnameController,
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
                        suffixIcon: Icon(Icons.person, color: Colors.white,),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 45.0),

                    // phone number
                    const Text('Phone',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField (
                      controller: phoneController,
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
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 5.0),

                    // birthdate
                    Row(
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
                          child: const Text('Change'),
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
                              dateAsString = reverseDate(_date);
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 25.0),

                    // update profile button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[700],
                          padding: const EdgeInsets.all(20.0),
                        ),
                        child: const Text('Update Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                          ),
                        ),
                        onPressed: () async {
                          if(_formState.currentState!.validate()) {

                            // pass to profile controller for account updates
                            tempUser.firstName = fnameController.text;
                            tempUser.lastName = lnameController.text;
                            tempUser.phoneNum = phoneController.text;
                            tempUser.birthDate = _date;
                            tempUser.password = globals.currentUser.password;

                            if(await profileController(tempUser)) {
                              // confirm to user that account created
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profile has been updated'),
                                ),
                              );
                              setState(() {});
                            // TODO - popUntil 'whoCalledMe'
                            // **** change navigation to calling screen ****
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (
                                    BuildContext context) =>
                                const HomePage(title: 'pairings',)), (
                                Route<dynamic> route) => false);
                            }
                            else {
                              // alert user failed profile update
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Error!'),
                                  content: const Text(
                                    'Profile update failed.'
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
                              setState(() {});
                            }
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 60.0),

                    // change password button
                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[700],
                          padding: const EdgeInsets.all(20.0),
                        ),
                        label: const Text('Change Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 40.0,
                          ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
                        },
                      ),
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
