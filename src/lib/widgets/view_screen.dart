import 'package:flutter/material.dart';
import 'layout.dart';
import 'add_elevated_button.dart';
import 'form.dart';
import 'package:get/get.dart';
import 'respsonsive_widget.dart';
import 'form_list.dart';

class ViewScreen extends StatelessWidget {

  const ViewScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
            body: Center(
              child: Column(children: [
                Text('ViewScreen'),
                Expanded( // expanded needed for ListView contained in FormList
                  child: ResponsiveWidget( // responsive widget shows lifting set entries in different layouts depending on breakpoints
                  smallDevice: FormListWidgetSmall(), 
                  mediumDevice: FormListWidgetMedium(), 
                  largeDevice: FormListWidgetLarge(),)
                  ,
                ),
                CustomElevatedButton(
                  onSubmit: () => Get.toNamed("/create"),
                  content: Icon(Icons.add),
                ),              
                ],
              ),
            ),
          ),
        );
  }
}