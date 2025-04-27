import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/models.dart';
import '../controllers/dashboard_controller.dart';

// navigation controller regulates the selected index globally
// this enables a peristent behavior of the navigation bar without rebuilding the nav bar on every page navigation and resetting the index to 0

class NavigationController{
  final RxInt selectedIndex = 0.obs; // initiates index for navigation as a reactive var, 
  // used to update navigation bar UI based on page index
}