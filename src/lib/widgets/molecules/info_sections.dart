import 'package:flutter/material.dart';
import '../../custom_styles.dart';

class InfoSectionWidgetMuscles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Style.insetXS,
      ), // adds bigger padding to bottom of app
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXS),
            child: Text(
              "Why We Care About Muscle Group, Not Exercise",
              style: TextStyle(fontSize: Style.fontH1, height: 1.1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXS),
            child: Text(
              "There are hundreds of exercises which can be varied to target specific muscle groups. For example, you can do a Bulgarian Split Squat so that you target your quadriceps (your upper leg) or your glutes just by splightly adjusting the angle of your upper body during the movement.",
              style: TextStyle(fontSize: Style.fontTextM),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXXS),
            child: Text(
              "It is about you finding the style of exercises that feel good for you and which you enjoy doing. We just care about the muscle group you target.",
              style: TextStyle(fontSize: Style.fontTextM),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSectionWidgetVolume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Style.insetS, bottom: Style.insetS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How the Training Works",
            style: TextStyle(fontSize: Style.fontH1),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXS),
            child: Text(
              "There is a lot of wisdom out there what builds strength. Let's not get lost in finding the perfect amount of repitions or weight. Eventually it comes down to the volume you move with a muscle group.",
              style: TextStyle(fontSize: Style.fontTextM),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXXS),
            child: Text(
              "Muscle strength = volume",
              style: TextStyle(
                fontSize: Style.fontTextM,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXXS),
            child: Text(
              "Volume = Repititions x Weight",
              style: TextStyle(
                fontSize: Style.fontTextM,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXS),
            child: Text(
              "Example for Glutes: 450 kg = 30 reps x 15 kg",
              style: TextStyle(
                fontSize: Style.fontTextM,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: Style.insetXS),
            child: Text(
              "For example: In your training this week, you did an exercise for your glutes. The type of exercise doesn't matter. You could have done classic squats with a barbell or used a hip thrust machine at your gym. You did 3 sets with 10 repitions each = 30 repititions. You used 15kg consistently in all sets. That makes 30 repititions x 15kf = 450 kg volume",
              style: TextStyle(fontSize: Style.fontTextM),
            ),
          ),
          Text(
            "Everyone trains differently. You can train with low repititions and high weight or a lot of repititions and lower weight. Eventually, you will move the same volume with your muscle.",
            style: TextStyle(fontSize: Style.fontTextM),
          ),
        ],
      ),
    );
  }
}
