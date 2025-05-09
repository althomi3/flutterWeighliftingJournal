import 'package:flutter/material.dart';

class Style {
  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: colorFillSecondary,
    textStyle: TextStyle(color: fontColorDark),
  );

  //Padding
  static final insetXXXS = 4.0;
  static final insetXS = 14.0;
  static final insetS = 20.0;
  static final insetXXS = 8.0;
  static final insetL = 24.0;
  static final insetXL = 30.0;
  static final insetXXL = 50.0;

  // Fontsize
  static final fontH1 = 24.0;
  static final fontTextM = 16.0;
  static final fontTextS = 14.0;
  static final fontTextL = 18.0;
  static final fontTextXL = 30.0;
  static final label = 12.0;

  // colors
  static final colorFillPrimary = const Color.fromARGB(255, 207, 234, 225);
  static final colorFillSecondary = const Color.fromARGB(223, 221, 253, 247);
  static final colorFillTertiary = const Color.fromARGB(247, 247, 251, 251);

  static final colorPrimaryAction = const Color.fromARGB(255, 27, 28, 27);
  static final fontColorLight = const Color.fromARGB(255, 251, 255, 254);
  static final fontColorDark = const Color.fromARGB(255, 42, 43, 43);

  // Specs
  static final widthButtonMedium = 200.0;
  static final widthButtonXS = 100.0;
  static final widthPromoCard = 350.0;
}
