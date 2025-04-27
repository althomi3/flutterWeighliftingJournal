import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../custom_styles.dart';
import '../atoms/add_elevated_button.dart';
import 'package:get/get.dart';

// Stage widget
// contains Asset + Text Container

class StageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(right: Style.insetXS),
                  child: Container(
                    constraints: BoxConstraints(
                      // max height set to avoid infinite scaling
                      maxHeight: 400,
                    ),

                    child: AspectRatio(
                      // helps to align image vertically
                      aspectRatio:
                          1, // aspect ratio lets image scale without adding padding from maxheight which is set above
                      child: SvgPicture.asset(
                        'assets/13317058_5215746.svg',
                        semanticsLabel: 'Climbing woman',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Build True Climbing Strength With Weight Lifting",
                  style: TextStyle(fontSize: Style.fontH1, height: 1.2),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetL, top: Style.insetXS),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: Style.insetS,
                      left: Style.insetS,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You don't need to look like Hercules to be strong. The Climbing Strength Tracker helps you grow your body strength with targeted weight lifting.",
                          style: TextStyle(
                            fontSize: Style.fontTextM,
                            height: 1.2,
                          ),
                        ),

                        // takes as much space as available
                        Padding(
                          padding: EdgeInsets.only(top: Style.insetS),
                          child: SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              onSubmit: () => Get.toNamed("/create"),
                              content: Text(
                                "Start tracking",
                                style: TextStyle(color: Style.fontColorLight),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
