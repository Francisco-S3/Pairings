import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pairings/config/theme.dart';
import 'package:provider/provider.dart';
import './views/loading.dart';
import 'views/home.dart';
import 'views/saved.dart';
import 'views/signin.dart';

/// Program Main
/// Only used to load environment and redirect to loading screen
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'pairings',
          //themeMode: ThemeMode.themeMode,
          theme: PairingThemes.darkTheme,
          home: const Loading(),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [HomePage(title: 'Pairings: Home'), SavedPage()];

  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        floatingActionButton: buildFAB(),
        bottomNavigationBar: buildNavigationBar(),
      );

  Widget buildNavigationBar() => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          indicatorColor: Colors.white,
        ),
        child: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          // animationDuration: Duration(seconds: 3),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.white,
              ),
              selectedIcon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
          ],
        ),
      );

  Widget? buildFAB() {
    final shape = BeveledRectangleBorder(borderRadius: BorderRadius.zero);

    switch (index) {
      case 1:
        return FloatingActionButton.extended(
          shape: shape,
          backgroundColor: Color.fromARGB(255, 78, 40, 69),
          icon: Icon(Icons.person),
          label: Text('Sign in'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => new SigninScreen()));
          },
        );
      default:
        return null;
    }
  }
}
