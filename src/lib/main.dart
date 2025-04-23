import 'package:flutter/material.dart';
import 'widgets/home_screen.dart';

//------------------------------------------

//APP ENTRY POINT
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// ROOT
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // sets title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // defines theme
      ),
      home: const HomeScreen(title: 'Weighlifting Progress Tracker'), // sets title prop of HomeScreen widget
    );
  }
}
//---------------------------------------------------------------------------

