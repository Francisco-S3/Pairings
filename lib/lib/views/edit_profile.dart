import 'package:flutter/material.dart';
import 'home.dart';
import '../models/utilities.dart';
import '../models/user.dart';
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

  late User currentUser;
  late bool passwordVisibility;
  final _formState = GlobalKey<FormState> ();

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;

    _date = DateTime(DateTime.now().year-21, DateTime.now().month, DateTime.now().day);

    // initialize local variable with currentUser information here
    if(globals.isLoggedIn) {
      //currentUser = globals.currentUser;
      // TODO - *********** IMPORTANT ********************
      // TODO - remove this code once create account is operational
      currentUser = User.partial(
        email: 'test@test.com',
        password: 'password',
        firstName: 'firstName',
        lastName: 'lastName',
        phoneNum: '336-555-1212',
        birthDate: DateTime(2000),
      );
      dateAsString = convertDateTime(currentUser.birthDate);
    }
    else {
      // TODO - *********** IMPORTANT ********************
      // TODO - need to address null error here
      currentUser = User.partial(
          email: 'test@test.com',
          password: 'password',
          firstName: 'firstName',
          lastName: 'lastName',
          phoneNum: '336-555-1212',
          birthDate: DateTime(2000),
      );
      dateAsString = convertDateTime(currentUser.birthDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',
          style: TextStyle(color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        // TODO - add icon.arrow_back_ios to appBar
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
                    initialValue: currentUser.firstName,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    enableSuggestions: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(Icons.account_circle, color: Colors.white,),
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
                    initialValue: currentUser.lastName,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    enableSuggestions: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(Icons.account_circle, color: Colors.white,),
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
                    initialValue: currentUser.phoneNum,
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
                            dateAsString = convertDate(_date);
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 25.0),

                  // create profile button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[700],
                        padding: const EdgeInsets.all(20.0),
                      ),
                      child: const Text('Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                        ),
                      ),
                      onPressed: () {

                        // TODO - verify this code
                        // TODO - pushandRemoveUntil 'whoCalledMe'
                        // **** change navigation to calling screen ****
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const HomePage(title: 'pairings',)), (Route<dynamic> route) => false);
                      },
                    ),
                  ),

                  const SizedBox(height: 45.0),

                  const Text('Change Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                  const Icon(
                    Icons.password,
                    color: Colors.white,
                    size: 40.0,
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
