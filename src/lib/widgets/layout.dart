import 'package:flutter/material.dart';
import '../widgets/floating_action_button.dart';
import 'nav_bar.dart';



class MainLayout extends StatelessWidget{
  const MainLayout({
    super.key,
    required this.body,
    this.title = const Text('Weightlifting Progress Tracker'),
    });

    final Widget body;
    final Text title;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: title,
      ),
      body: body,
      floatingActionButton: 
        CustomFloatingActionButton(icon: Icon(Icons.add)),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}