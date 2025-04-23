import 'package:flutter/material.dart';
import 'layout.dart';


class EditScreen extends StatelessWidget {

  const EditScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Center(
          child: Text('!Here goes your form to EDIT an entry!'),
      ),
    );
  }
}