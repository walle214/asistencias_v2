import 'package:flutter/material.dart';

class CustomColors {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static final Color green = fromHex('#4ea728');
  static final Color darkGreen = fromHex('#007828');
  static final Color yellow = fromHex('#feca00');
  static final Color darkYellow = fromHex('#bf9900');
  static final Color red = fromHex('#e7003f');
  static final Color darkRed = fromHex('#a8002d');
  static final Color blue = fromHex('#23a3e5');
  static final Color darkBlue = fromHex('#260063');
  static final Color lowDarkBlue = fromHex('#1f92cc');
}
