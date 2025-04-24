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
                ResponsiveWidget(
                  small_device: FormListWidgetSmall(), 
                  medium_device: Text("TBA medium"), 
                  large_device: Text("TBA large")),
                CustomElevatedButton(icon: Icon(Icons.add)),
              ],
              ),
            ),
          ),
        );
  }
}