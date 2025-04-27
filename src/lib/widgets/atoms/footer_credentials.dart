import 'package:flutter/material.dart';
import '../../custom_styles.dart';

class FooterCredentialsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Designed and Developed by Alischa Thomas 2025",
        style: TextStyle(fontSize: Style.label),
      ),
    );
  }
}
