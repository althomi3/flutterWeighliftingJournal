// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/widgets/atoms/promo_cards.dart';

// Widgets
import 'layout.dart';
import '../atoms/add_elevated_button.dart';
import 'dashboard_card.dart';
import '../../custom_styles.dart';
import 'stage.dart';
import '../molecules/info_sections.dart';
import '../atoms/footer_credentials.dart';

// HOMESCREEN

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        body: SingleChildScrollView(
          // prevents overflow issues and makes content scollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StageWidget(), // imported custom widget
              Card(
                // not isolated in separate file because widget is too simple
                color: Style.colorFillTertiary,
                child: Padding(
                  padding: EdgeInsets.all(Style.insetXXS),
                  child: ListTile(
                    title: Text(
                      "💡 Female Pro Tip",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Remember: everyone has their strength. As women, we naturally tend to have a strong lower body. Strong legs are key in climbing. By training you lower body muscle strength, you will ascend the wall like a walk in the park",
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: Style.insetXXS),
                child: DashboardCardWidget(),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: Style.insetS),
                child: Center(
                  child: SizedBox(
                    width: Style.widthButtonMedium,
                    child: CustomElevatedButton(
                      // not isolated in separate file because widget is too simple
                      onSubmit: () => Get.toNamed("/create"),
                      content: Icon(Icons.add, color: Style.fontColorLight),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Style.insetXS),
                    child: InfoSectionWidgetVolume(),
                  ),
                  InfoSectionWidgetMuscles(),
                  Padding(
                    padding: EdgeInsets.only(bottom: Style.insetXXS),
                    child: PromoCardWidget(
                      title: "📣 Coming Soon: Exercise Guide",
                      subtitle:
                          "Find exercises you like and that build the strength you want.",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Style.insetL),
                    child: PromoCardWidget(
                      title: "📣 Coming Soon: Progress Graphs",
                      subtitle:
                          "Check your progress quickly with beautical graphs.",
                    ),
                  ),
                ],
              ),
              FooterCredentialsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
