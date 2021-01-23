import 'package:flutter/material.dart';

class CustomColors {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color green = fromHex('#4ea728');
  static Color darkGreen = fromHex('#007828');
  static Color yellow = fromHex('#feca00');
  static Color darkYellow = fromHex('#bf9900');
  static Color red = fromHex('#e7003f');
  static Color darkRed = fromHex('#a8002d');
  static Color blue = fromHex('#23a3e5');
  static Color darkBlue = fromHex('#260063');
  static Color lowDarkBlue = fromHex('#1f92cc');
}
