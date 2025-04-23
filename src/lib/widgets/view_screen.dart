import 'package:flutter/material.dart';
import 'layout.dart';
import 'add_elevated_button.dart';
import 'form.dart';


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
                FormListWidget(),
                CustomElevatedButton(icon: Icon(Icons.add)),
              ],
              ),
            ),
          ),
        );
  }
}