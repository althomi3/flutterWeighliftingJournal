import 'package:flutter/material.dart';

import 'create_screen.dart';
import 'view_screen.dart';
import 'edit_screen.dart';

import 'nav_bar.dart';
import '../widgets/floating_action_button.dart';

// HOMESCREEN
// Stateful with state object


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key, required this.title}); // sets key for public class HomeScreen

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(          
        ),
      ),
      floatingActionButton: 
        CustomFloatingActionButton(icon: Icon(Icons.add)),
      bottomNavigationBar: CustomNavigationBar(),
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
