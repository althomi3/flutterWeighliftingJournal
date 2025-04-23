import 'package:flutter/material.dart';
import 'layout.dart';
import 'form.dart';


class CreateScreen extends StatelessWidget {

  const CreateScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
            body: Center(
              child: Column(children: [
                Text('CreateScreen'),
                FormWidget(),
              ],
              ),
            ),
          ),
        );
  }
}