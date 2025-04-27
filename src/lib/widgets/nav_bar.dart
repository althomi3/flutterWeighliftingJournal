import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/controllers/navigation_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        // defines navigation logic based on destination index
        onDestinationSelected: (int index) {
          // callback returns index automatically
          navigationController.selectedIndex.value = index;

          if (index == 0) {
            // id index of selected destination = 0, navigates to HomeScreen
            Get.toNamed('/');
          } else if (index == 1) {
            // id index of selected destination = 1, navigates to ViewScreen
            Get.toNamed('/all');
          }
        },

        destinations: const <Widget>[
          NavigationDestination(
            // index 0
            selectedIcon: Icon(Icons.auto_graph_sharp),
            icon: Icon(Icons.auto_graph_sharp),
            label: 'Progress',
          ),
          NavigationDestination(
            // index 0
            selectedIcon: Icon(Icons.create),
            icon: Icon(Icons.create),
            label: 'Log Book',
          ),
        ],

        selectedIndex:
            navigationController
                .selectedIndex
                .value, // tells navigation bar to use the selected index
        // labelBehavior: onlyShowSelected,

        // selectedIndex needed to control tab behaviour
      ),
    );
  }
}
