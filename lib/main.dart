import 'package:bill_split_calculator/Screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///title of app
      title: 'Bill Split Calculator',

      ///debugShowCheckedModeBanner
      debugShowCheckedModeBanner: false,

      ///theme of app
      theme: ThemeData(
        // Primary color for the app
        primaryColor: Colors.indigo,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.indigo), // Button background color
            foregroundColor:
                MaterialStateProperty.all(Colors.white), // Button text color
          ),
        ),
      ),

      ///[initial Route]
      home: const HomeScreen(),
    );
  }
}
