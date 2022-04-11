import 'package:flutter/material.dart';
import 'package:pairings/config/theme.dart';
import 'package:provider/provider.dart';
import './views/loading.dart';

void main() {
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
