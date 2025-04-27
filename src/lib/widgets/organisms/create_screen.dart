import 'package:flutter/material.dart';
import 'layout.dart';
import '../molecules/form.dart';
import '../../custom_styles.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key}); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Style.insetXS,
                  bottom: Style.insetXS,
                ),
                child: Text(
                  "Log Your Training",
                  style: TextStyle(fontSize: Style.fontH1),
                ),
              ),
              Text("How it works", style: TextStyle(fontSize: Style.fontTextL)),

              Padding(
                padding: EdgeInsets.only(
                  top: Style.insetXS,
                  bottom: Style.insetXL,
                ),
                child: Text(
                  "During your training, you track each set. You might have seen others around your gym documenting their training with pen and paper. This works exactly the same. Just that we make it a bit easier and less messy with this handy form.",
                  style: TextStyle(fontSize: Style.fontTextM),
                ),
              ),

              FormWidget(
                isEditScreen: false,
                liftingsetToEdit: null,
              ), // lifting set defined as null because user creates a new set in this widget
            ],
          ),
        ),
      ),
    );
  }
}
