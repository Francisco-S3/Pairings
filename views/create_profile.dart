import 'package:flutter/material.dart';
import 'package:pairings/models/profile.dart';
import 'package:pairings/views/home.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({
    Key? key,
  }) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final List <String> months = [
    '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'
  ];
  final List <String> days = [
    '01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
    '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30',
    '31'
  ];
  final years = List <String>.generate(61, (index) => (DateTime.now().year - 21 - index).toString());

  String? monthSelected;
  String? daySelected;
  String? yearSelected;

  late Profile userProfile;

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

                // first name
                TextFormField (
                  controller: fnameController,
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

                // last name
                TextFormField (
                  controller: lnameController,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  enableSuggestions: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
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

                // phone number
                TextFormField (
                  controller: phoneController,
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

                // birthdate
                const Text('Birthdate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Text('Month',
                            style: TextStyle(color: Colors.white),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              menuMaxHeight: 300.0,
                              dropdownColor: Colors.black,
                              items: months.map(buildMenuItem).toList(),
                              value: monthSelected,
                              onChanged: (value) => setState(() => monthSelected = value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Text('Day',
                            style: TextStyle(color: Colors.white),
                          ),
                          DropdownButton<String>(
                            menuMaxHeight: 300.0,
                            dropdownColor: Colors.black,
                            items: days.map(buildMenuItem).toList(),
                            value: daySelected,
                            onChanged: (value) => setState(() => daySelected = value),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Text('Year',
                            style: TextStyle(color: Colors.white),
                          ),
                          DropdownButton<String>(
                            menuMaxHeight: 300.0,
                            dropdownColor: Colors.black,
                            items: years.map(buildMenuItem).toList(),
                            value: yearSelected,
                            onChanged: (value) => setState(() => yearSelected = value),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.0),

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

                    //TODO - check for null values before combining date strings
                    String temp = yearSelected! + monthSelected!.padLeft(2, '0') + daySelected!.padLeft(2, '0');
                    print(temp);
                    //userProfile = Profile.partial(id: 1001, createDate: temp);
                    //userProfile = Profile(fnameController, lnameController, phoneController);

                    //**** change navigation to home screen ****
                    //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
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

  DropdownMenuItem<String> buildMenuItem(String item) =>
    DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
}
