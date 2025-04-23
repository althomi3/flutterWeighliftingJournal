// Package Imports
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:src/widgets/create_screen.dart';
import 'package:src/widgets/view_screen.dart';
import 'package:get/get.dart';

// Widget Imports
import 'widgets/home_screen.dart';
import 'widgets/form.dart';



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
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/create", page: () => CreateScreen()),
        GetPage(name: "/all", page: () => ViewScreen()),

      ],
      title: 'Flutter Demo', // sets title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // defines theme
      ),
    );
  }
}
//---------------------------------------------------------------------------

