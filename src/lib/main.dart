// Package Imports
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:src/custom_styles.dart';
import 'package:src/widgets/organisms/create_screen.dart';
import 'package:src/widgets/organisms/view_screen.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget Imports
import 'widgets/organisms/home_screen.dart';
import 'widgets/organisms/edit_screen.dart';

//Controller Imports
import 'controllers/form_controller.dart';
import 'controllers/dashboard_controller.dart';
import 'controllers/navigation_controller.dart';

// Model Imports
import 'models/models.dart';

/// // ...

//------------------------------------------

//APP ENTRY POINT
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<FormController>(
    () => FormController(),
  ); // registers controller for form
  Get.lazyPut<DashboardCardController>(
    () => DashboardCardController(),
  ); // registers controller for statistics
  Get.lazyPut<NavigationController>(
    () => NavigationController(),
  ); // registers controller for navigation

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ROOT
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/create", page: () => CreateScreen()),
        GetPage(name: "/all", page: () => ViewScreen()),
        GetPage(
          name: "/edit/:id",
          page: () => EditScreen(),
        ), // navigates to view to edit data entry with specific id via path variable
      ],
      title: 'Climbing Strength', // sets title
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)), // defines theme
      ),*/
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ), // screen background
        colorScheme: ColorScheme.light(
          secondary: Colors.black, // secondary color (not super important here)
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(
            255,
            27,
            28,
            27,
          ), // AppBar background color
          titleTextStyle: TextStyle(color: Colors.white),
          // AppBar text color
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 224, 235, 232),
        ),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}

//GLOBAL SCROLL BEHAVIOUR
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind
        .mouse, // although app is for mobile, I enabled mouse interaction for accessibility
    PointerDeviceKind.trackpad,
  };
}

//---------------------------------------------------------------------------
