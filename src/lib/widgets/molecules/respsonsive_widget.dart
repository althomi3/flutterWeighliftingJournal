import 'package:flutter/material.dart';
import '../../breakpoints.dart';



// the responsive widget assesses the parent width and
// exepcts a widget that should be displayed according to that width (e.g., small_device)
class ResponsiveWidget extends StatelessWidget {

  // constructor
  final Widget smallDevice;
  final Widget mediumDevice;
  final Widget largeDevice;


  const ResponsiveWidget({
    super.key,
    required this.smallDevice, 
    required this.mediumDevice, 
    required this.largeDevice});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < Breakpoints.breakpoint_s) {
          return smallDevice;
        } else if (constraints.maxWidth >= Breakpoints.breakpoint_s && constraints.maxWidth < Breakpoints.breakpoint_m) {
          return mediumDevice;
        } else {
          return largeDevice;
        }
      },
    );
  }
}