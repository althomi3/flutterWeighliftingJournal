import 'package:flutter/material.dart';
import 'package:src/custom_styles.dart';
import 'layout.dart';
import '../atoms/add_elevated_button.dart';
import 'package:get/get.dart';
import '../molecules/respsonsive_widget.dart';
import '../trainingset_list.dart';

// VIEW SCREEN
// View shows different types of content based on two conditions:
// content available: yes, no. If no, show empty state
// breakpoints for screen size: triggers layout changes

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key}); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Style.insetXXS),
                child: Text(
                  "Log Book",
                  style: TextStyle(fontSize: Style.fontH1),
                ),
              ),
              Expanded(
                // expanded needed for ListView contained in FormList
                child: ResponsiveWidget(
                  // responsive widget shows lifting set entries in different layouts depending on breakpoints
                  smallDevice: FormListWidgetSmall(),
                  mediumDevice: FormListWidgetMedium(),
                  largeDevice: FormListWidgetLarge(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Style.insetXS),
                child: Center(
                  child: SizedBox(
                    width: Style.widthButtonMedium,
                    child: CustomElevatedButton(
                      onSubmit: () => Get.toNamed("/create"),
                      content: Icon(Icons.add, color: Style.fontColorLight),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
