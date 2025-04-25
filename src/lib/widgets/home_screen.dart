import 'package:flutter/material.dart';
import '../widgets/layout.dart';
import 'add_elevated_button.dart';
import 'package:get/get.dart';
import 'dashboard_card.dart';

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
                Text('HomeScreen Test Github Actions'),
                DashboardCardWidget(),
                CustomElevatedButton(
                  onSubmit: () => Get.toNamed("/create"),
                  content: Icon(Icons.add),
                ),
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
