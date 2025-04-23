import 'package:flutter/material.dart';
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
    return Center(
      child: SizedBox(
        width: 768,
        child:
          Scaffold(
                      appBar: AppBar(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      title: title,
                      ),
                      body: body,
                      bottomNavigationBar: CustomNavigationBar(),
          )
      )
    );
  }
}