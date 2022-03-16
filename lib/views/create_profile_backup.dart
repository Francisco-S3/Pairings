import 'package:flutter/material.dart';
import 'package:pairings/models/profile.dart';
import 'package:pairings/views/home.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({
    Key? key,
    //this.userProfile,
  }) : super(key: key);

  //final Profile userProfile;

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile',
          style: TextStyle(color: Colors.white,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
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
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 40, 40, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField (
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.account_circle, color: Colors.white,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 25.0),

                TextFormField (
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.contacts, color: Colors.white,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 25.0),

                TextFormField (
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.phone, color: Colors.white,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 25.0),

                TextFormField (
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Birthdate (mm/dd/yyyy)',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.cake, color: Colors.white,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),

                SizedBox(height: 25.0),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700],
                    padding: const EdgeInsets.all(20.0),
                  ),
                  child: const Text('Create Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () {
                    //**** change navigation to home screen ****
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
                    print('profile creation successful');
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
