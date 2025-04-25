import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form.dart';
import '../custom_styles.dart';

class DashboardCardConstructor {
  //define your function to calculate the volume here
  
}

class DashboardCardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            Text('Average Volume'),
            Text('Info text about volumne'),
            Text('Statistics'),
            ],
          ),
    );
  }
}