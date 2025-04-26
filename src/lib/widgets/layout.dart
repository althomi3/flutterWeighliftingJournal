import 'package:flutter/material.dart';
import 'nav_bar.dart';
import '../custom_styles.dart';



class MainLayout extends StatelessWidget{
  const MainLayout({
    super.key,
    required this.body,
    this.title = const Text('Climbing Strength Builder'),
    });

    final Widget body;
    final Text title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1200,
        child:
          Scaffold(
                      appBar: AppBar(
                      title: title,
                      ),
                      body: 
                      Padding(padding:Style.contentMargin, child: body) // general pading creates a space between all content and viewport edge
                      ,
                      bottomNavigationBar: CustomNavigationBar(),
          )
      )
    );
  }
}