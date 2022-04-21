import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'views/signin.dart';
import './views/loading.dart';
import 'views/home.dart';
import 'views/saved.dart';
import 'views/product_info.dart';
import 'config/globals.dart' as globals;
import 'dart:async';

StreamController<bool> streamController = StreamController<bool>();

/// Program Main
/// Only used to load environment and redirect to loading screen
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          home: Loading(),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  late final Stream<bool> stream;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [const HomePage(title: 'Pairings: Home'), SavedPage()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        floatingActionButton: buildFAB(),
        bottomNavigationBar: buildNavigationBar(),
      );

  Widget buildNavigationBar() => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          indicatorColor: Colors.white,
        ),
        child: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          // animationDuration: Duration(seconds: 3),
          destinations: const [
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
    const shape = BeveledRectangleBorder(borderRadius: BorderRadius.zero);

    switch (index) {
      case 1:
        return Visibility(
          visible: true,
          child: FloatingActionButton.extended(
            shape: shape,
            backgroundColor: const Color.fromARGB(255, 78, 40, 69),
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SigninScreen()));
            },
          ),
        );
      default:
        return null;
    }
  }
}

class _MainPageSignedFromSavedState extends State<MainPage> {
  int index = 1;
  final screens = [const HomePage(title: 'Pairings: Home'), SavedPage()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        floatingActionButton: buildFAB(),
        bottomNavigationBar: buildNavigationBar(),
      );

  Widget buildNavigationBar() => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          indicatorColor: Colors.white,
        ),
        child: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          // animationDuration: Duration(seconds: 3),
          destinations: const [
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
    const shape = BeveledRectangleBorder(borderRadius: BorderRadius.zero);

    switch (index) {
      case 1:
        return Visibility(
          visible: false,
          child: FloatingActionButton.extended(
            shape: shape,
            backgroundColor: const Color.fromARGB(255, 78, 40, 69),
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SigninScreen()));
            },
          ),
        );
      default:
        return null;
    }
  }
}

class _MainPageSignedState extends State<MainPage> {
  int index = 0;
  final screens = [const HomePage(title: 'Pairings: Home'), SavedPage()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        floatingActionButton: buildFAB(),
        bottomNavigationBar: buildNavigationBar(),
      );

  Widget buildNavigationBar() => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          indicatorColor: Colors.white,
        ),
        child: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          // animationDuration: Duration(seconds: 3),
          destinations: const [
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
    const shape = BeveledRectangleBorder(borderRadius: BorderRadius.zero);

    switch (index) {
      case 1:
        return Visibility(
          visible: false,
          child: FloatingActionButton.extended(
            shape: shape,
            backgroundColor: const Color.fromARGB(255, 78, 40, 69),
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SigninScreen()));
            },
          ),
        );
      default:
        return null;
    }
  }
}

void signIn() {
  if (globals.isLoggedIn) {}
}
