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
      
      body: Center(
        child: SizedBox(
              width: 768, // setting max with so that it works for smartphones and landscape tablets (https://www.w3schools.com/howto/howto_css_media_query_breakpoints.asp)
              child: Scaffold( // wraps app in scaffold within SizedBox to apply max width
                appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: title,
                ),
                body: body,
                floatingActionButton: 
                CustomFloatingActionButton(icon: Icon(Icons.add)),
                bottomNavigationBar: CustomNavigationBar(),
              ),
        ),
      ),
    );
  }
}