// Package Imports
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:src/widgets/create_screen.dart';
import 'package:src/widgets/view_screen.dart';
import 'package:get/get.dart';
import 'dart:ui';


// Widget Imports
import 'widgets/home_screen.dart';
import 'widgets/form.dart';
import 'widgets/edit_screen.dart';
import 'widgets/custom_card.dart';



//------------------------------------------

//APP ENTRY POINT
Future <void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<FormController>(() => FormController()); // registers controller for form
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
        GetPage(name: "/edit/:id", page: () => EditScreen()), // navigates to view to edit data entry with specific id via path variable
      ],
      title: 'Flutter Demo', // sets title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // defines theme
      ),
    );
  }
}

//GLOBAL SCROLL BEHAVIOUR
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse, // although app is for mobile, I enabled mouse interaction for accessibility
        PointerDeviceKind.trackpad,
      };
}

//---------------------------------------------------------------------------

