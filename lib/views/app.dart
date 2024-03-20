import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DS App",
      theme: ThemeData.light(useMaterial3: true).copyWith(
          appBarTheme: AppBarTheme(
        backgroundColor: ThemeData.light().colorScheme.primaryContainer,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: ThemeData.light().colorScheme.onPrimaryContainer,
        ),
      )),
      home: const HomePage(),
    );
  }
}
