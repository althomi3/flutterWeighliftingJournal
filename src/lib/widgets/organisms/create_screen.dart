import 'package:flutter/material.dart';
import 'layout.dart';
import '../molecules/form.dart';
import '../../custom_styles.dart';
import '../molecules/info_sections.dart';
import '../atoms/promo_cards.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key}); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Style.insetXXS),
                child: Text(
                  "Log Your Training",
                  style: TextStyle(fontSize: Style.fontH1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Style.insetXXS),
                child: Text(
                  "This form helps you tracking your training intentionally to build muscle strength. For example, you train your glutes with 3 sets of squats. Log each of the sets individually. ",
                  style: TextStyle(fontSize: Style.fontTextM),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Style.insetL),
                child: Text(
                  "Pro Tipp: Track after each set. It feels great to log achievements and gives you flexibility to adjust the weight or reps during the set. ",
                  style: TextStyle(fontSize: Style.label),
                ),
              ),

              FormWidget(
                isEditScreen: false,
                liftingsetToEdit: null,
              ), // lifting set defined as null because user creates a new set in this widget
              InfoSectionWidgetMuscles(),
              Padding(
                padding: EdgeInsets.only(bottom: Style.insetXXS),
                child: PromoCardWidget(
                  title: "📣 Coming Soon: Exercise Guide",
                  subtitle:
                      "Find exercises that you like and that build strength the strength you want.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
