import 'package:flutter/material.dart';
import '../breakpoints.dart';

// the responsive widget assesses the parent width and
// exepcts a widget that should be displayed according to that width (e.g., small_device)
class ResponsiveWidget extends StatelessWidget {

  // constructor
  final Widget small_device;
  final Widget medium_device;
  final Widget large_device;


  const ResponsiveWidget({required this.small_device, required this.medium_device, required this.large_device});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < Breakpoints.breakpoint_s) {
          return small_device;
        } else if (constraints.maxWidth >= Breakpoints.breakpoint_s && constraints.maxWidth < Breakpoints.breakpoint_m) {
          return medium_device;
        } else {
          return large_device;
        }
      },
    );
  }
}