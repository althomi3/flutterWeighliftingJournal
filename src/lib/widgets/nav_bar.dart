import 'package:flutter/material.dart';
//import '../destinations.dart';


class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home_outlined),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          ),
        NavigationDestination(
          selectedIcon: Icon(Icons.list),
          icon: Icon(Icons.list),
          label: 'All',
          ),
      ],
    );
  }
}
