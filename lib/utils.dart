import 'package:flutter/material.dart';

class IconAndColor {
  final IconData icon;
  final Color iconColor;

  IconAndColor(this.icon, this.iconColor);
}

IconAndColor getIconAndColor(String condition) {
  late IconData icon;
  late Color iconColor;

  if (condition == 'Clouds') {
    icon = Icons.cloud;
    iconColor = Colors.black;
  } else {
    icon = Icons.sunny;
    iconColor = Colors.yellow;
  }

  return IconAndColor(icon, iconColor);
}
