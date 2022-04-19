import "package:flutter/material.dart";
import 'package:provider/provider.dart';

/// Theme Classes
/// used to apply visual color themes to the application.
/// switching between theme options is controlled on the setting
/// option screen

/// Change notifier for theme toggle button
class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

/// Application theme parameters for light and dark modes
class PairingThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      primaryColor: Colors.black,
      indicatorColor: const Color.fromARGB(255, 78, 40, 69),
      iconTheme: const IconThemeData(color: Colors.white, size: 30.0),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 78, 40, 69)),
        ),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 20,
        ),
      ).apply(
        bodyColor: Colors.white,
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white));

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
    colorScheme: const ColorScheme.light(),
  );
}

/// theme for toggle switch on settings
// class ChangeThemeButtonWidget extends StatelessWidget {
//   const ChangeThemeButtonWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final themeProvide = Provider.of<ThemeProvider>(context);
//     return Switch.adaptive(
//         value: themeProvider.isDarkMode,
//         onChanged: (value) {
//           final provider = Provider.of<ThemeProvider>(context, listen: false);
//           provider.toggleTheme(value);
//         },
//     );
//   }
// }

// function to provide an alternate color theme
Widget buildColorTheme() {
  return Theme(
    data: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orangeAccent,
    ),
    child: Container(),
  );
}

// function to provide a dark theme
Widget buildDarkTheme() {
  return Theme(
    data: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orangeAccent,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        headline6: TextStyle(
          color: Colors.white,
        ),
      ).apply(bodyColor: Colors.white),
    ),
    child: Container(),
  );
}
