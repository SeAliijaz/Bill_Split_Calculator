import 'package:bill_split_calculator/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // Text theme
        textTheme: GoogleFonts.sairaTextTheme().copyWith(
          // Customize the text styles
          displayLarge: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16.0,
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
