    
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../custom_styles.dart';
import 'add_elevated_button.dart';
import 'package:get/get.dart';

// Stage widget
// contains Asset + Text Container

class StageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
     return IntrinsicHeight(
                  child: Row(
                  children: [
                    Expanded (
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(Style.insetS),
                        child: Container(
                          constraints: BoxConstraints( // max height set to avoid infinite scaling
                            maxHeight: 400,
                          ),
                          
                          child: AspectRatio( // helps to align image vertically
                            aspectRatio: 1, // aspect ratio lets image scale without adding padding from maxheight which is set above
                            child: SvgPicture.asset(
                                'assets/13317058_5215746.svg',
                                semanticsLabel: 'My SVG Image',
                                fit: BoxFit.contain
                              ),
                          ) 
                        ),
                        ),
                    ),
                    Expanded (
                      child: Padding(
                        padding: EdgeInsets.all(Style.insetS),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: Style.insetXXXS), 
                              child: Text("Build true climbing strength with weight lifting",
                                style: TextStyle(fontSize: Style.fontH1)),
                                ),
                            Padding(
                              padding: EdgeInsets.only(bottom: Style.insetXS),
                              child: Text("You don't need to look like Hercules to be strong. The Climbing Strength Tracker helps you to grow your body strength with targeted weight lifting.", 
                                style: TextStyle(fontSize: Style.fontTextM,),
                                ),
                              ),
                              // takes as much space as available
                            SizedBox(
                                width: double.infinity,
                                child: CustomElevatedButton(
                                  onSubmit: () => Get.toNamed("/create"), 
                                  content: Text("Start tracking")),
                                ),           
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
   