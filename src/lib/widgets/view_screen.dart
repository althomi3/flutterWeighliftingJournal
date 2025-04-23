import 'package:flutter/material.dart';
import 'layout.dart';


class ViewScreen extends StatelessWidget {

  const ViewScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Center(
          child: Text('ViewScreen'),
      ),
    );
  }
}