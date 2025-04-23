import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomNavigationBar extends StatelessWidget {

  CustomNavigationBar ({super.key
  
  }); // constructor

  //var index = 0.obs; // initiates index for navigation as a reactive var


  @override
  Widget build(BuildContext context) {
    return NavigationBar(

      // defines navigation logic based on destination index
      onDestinationSelected: (int index) { // callback returns index automatically
        if (index == 0) { // id index of selected destination = 0, navigates to HomeScreen
          Get.toNamed('/');
        } else if (index == 1) { // id index of selected destination = 1, navigates to ViewScreen
          Get.toNamed('/all');
        }
      },

      destinations: const <Widget>[
        NavigationDestination( // index 0
          selectedIcon: Icon(Icons.home_outlined),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          ),
        NavigationDestination( // index 0
          selectedIcon: Icon(Icons.list),
          icon: Icon(Icons.list),
          label: 'All',
          ),
      ],
    );

  }
}
