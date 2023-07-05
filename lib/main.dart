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
        ///Text Theme
        textTheme: GoogleFonts.sairaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      ///[initial Route]
      home: HomeScreen(),
    );
  }
}
