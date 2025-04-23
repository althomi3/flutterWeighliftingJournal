import 'package:flutter/material.dart';

import '../widgets/layout.dart';
import 'add_elevated_button.dart';



// HOMESCREEN
// Stateful with state object


class HomeScreen extends StatelessWidget {

  const HomeScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
            body: Center(
              child: Column(children: [
                Text('HomeScreen'),
                CustomElevatedButton(icon: Icon(Icons.add)),
              ],
              ),
            ),
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

    Center(
        child: SizedBox(
              width: 768, 

    
  }*/
