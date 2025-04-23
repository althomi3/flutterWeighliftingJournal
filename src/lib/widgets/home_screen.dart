import 'package:flutter/material.dart';

import 'create_screen.dart';
import 'view_screen.dart';
import 'edit_screen.dart';
import '../widgets/layout.dart';



// HOMESCREEN
// Stateful with state object


class HomeScreen extends StatelessWidget {

  const HomeScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Center(
          child: Text('HomeScreen'),
      ),
    );
  }
}

// Parking lot
/*class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  // sets state
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/
