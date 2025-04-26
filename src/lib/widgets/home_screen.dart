// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widgets
import '../widgets/layout.dart';
import 'add_elevated_button.dart';
import 'dashboard_card.dart';
import '../custom_styles.dart';
import 'stage.dart';


// HOMESCREEN

class HomeScreen extends StatelessWidget {

  const HomeScreen({
    super.key,
    }); // sets key for public class HomeScreen


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
                Card( // not isolated in separate file because widget is too simple
                  color: Style.colorFillSecondary,
                  child: Padding(
                    padding: Style.insetXXS,
                    child: ListTile(
                    title: Text("💡 Female Pro Tip", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Remember: everyone has their strength. As women, we naturally tend to have a strong lower body. Strong legs are key in climbing. By training you lower body muscle strength, you will ascend the wall like a walk in the park"),
                    ),)
                  ),
                
                
                DashboardCardWidget(),
                Text("How the training works", style: TextStyle(fontSize: Style.fontH1),),

                    Text("Training volume = muscle strength"),
                    Text("There is a lot of wisdom out there what builds strength. Let's not get lost in finding the perfect amount of repitions or weight. Eventually it comes down to the volume you move with a muscle group."),
                    Text("Volume = repitions x weight. For example: In your training this week, you did an exercise for your glutes. The type of exercise doesn't matter. You could have done classic squats with a barbell or used a hip thrust machine at your gym. You did 3 sets with 10 repitions each = 30 repititions. You used 15kg for all sets. That makes 30 repititions x 15kf = 450 kg volume"),

                    Text("Exercise doesn't matter but muscle group does"),
                    Text("There are hundreds of exercises which can be varied to target specific muscle groups. For example, you can do a Bulgarian Split Squat so that you target your quadriceps (your upper leg) or your glutes just by splightly adjusting the angle of your upper body during the movement. Eventually, it is about you finding the style of exercises that feel good for you. We just care about the muscle group you target."),
                CustomElevatedButton( // not isolated in separate file because widget is too simple
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

// Parking lot
/*class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  // sets state
  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    Center(
        child: SizedBox(
              width: 768, 

    
  }*/
