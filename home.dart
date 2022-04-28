import 'package:flutter/material.dart';
import 'package:pairings/views/pairings_search.dart';
import 'edit_profile.dart';
import 'indiv_search.dart';
import 'signin.dart';
import './settings.dart';
import './saved.dart';
import '../config/globals.dart' as globals;
import './pairings_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = ' ';

  // update the drawer username once a user is logged in
  void updateUser() {
    setState(() {
      globals.isLoggedIn
          ? username =
              globals.currentUser.firstName + ' ' + globals.currentUser.lastName
          : ' ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'pairings',
            style: TextStyle(fontFamily: 'Azonix', fontSize: 25),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: NotificationListener(
            onNotification: (notification) {
              updateUser();
              return true;
            },
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    username,
                    style: const TextStyle(fontSize: 30),
                  ),
                  accountEmail: null,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "http://thecardinalscellar.com/media/wysiwyg/the-ten-golden-rules-for-perfect-wine-pairing.jpg"),
                          opacity: 90)),
                ),
                ListTile(
                    title: const Text("Sign In"),
                    trailing: const Icon(Icons.person, color: Colors.white),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SigninScreen()));
                    }),
                ListTile(
                    title: const Text("Edit Profile"),
                    trailing: const Icon(Icons.person, color: Colors.white),
                    onTap: () {
                      Navigator.of(context).pop();
                      globals.isLoggedIn
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const EditProfile()))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SigninScreen()));
                    }),
                ListTile(
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.logout, color: Colors.white),
                  onTap: () => setState(() {
                    Navigator.of(context).pop();
                    globals.isLoggedIn = false;
                    updateUser();
                  }),
                ),
                ListTile(
                    title: const Text("Saved"),
                    trailing: const Icon(Icons.bookmark, color: Colors.white),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SavedPage()));
                    }),
                ListTile(
                    title: const Text("Settings"),
                    trailing: const Icon(Icons.settings, color: Colors.white),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SettingsPage()));
                    }),
                ListTile(
                  title: const Text("Help"),
                  trailing:
                      const Icon(Icons.help_outlined, color: Colors.white),
                ),
                const Divider(color: Colors.white),
                ListTile(
                  title: const Text("Close"),
                  trailing: const Icon(Icons.cancel, color: Colors.white),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 0,
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Center(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new IndivSearchPage()));
                            },
                            child: const Text(
                              'Individual',
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                side: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                                fixedSize: Size(240, 80),
                                padding: EdgeInsets.all(0)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new PairingsSearchPage()));
                            },
                            child: const Text(
                              'Pairings',
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              side: const BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                              fixedSize: Size(240, 80),
                            ),
                          ),
                        ),
                        // SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Featured',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "./lib/assets/images/BackgroundImage2.jpg"))),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 0,
                  fit: FlexFit.loose,
                  child: Center(
                    child: Text(
                      "Silver Oak Cabernet Sauvingon",
                      style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
