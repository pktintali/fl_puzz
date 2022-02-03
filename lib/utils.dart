import 'package:flutter/material.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static double getBoxSize(int n) {
    switch (n) {
      case 3:
        return 135;
      case 4:
        return 115;
      case 6:
        return 70;
      default:
        return 100;
    }
  }

  static double getMobileBoxSize(int n) {
    switch (n) {
      case 3:
        return 72;
      case 4:
        return 60;
      case 6:
        return 40;
      default:
        return 50;
    }
  }

  static Color getElementColor(i) {
    switch (i) {
      case 0:
        return const Color(0xFF012345);
      case 1:
        return Colors.green;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.white;
      case 5:
        return Colors.lightBlueAccent;
      default:
        return Colors.brown;
    }
  }
}
