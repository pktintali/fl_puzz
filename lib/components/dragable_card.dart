import 'package:fl_puzz/components/custom_box.dart';
import 'package:flutter/material.dart';

class DragableCard extends StatelessWidget {
  final int i;
  const DragableCard({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      color: _getColor(i),
      child: const CustomBox(),
    );
  }

  Color _getColor(i) {
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
        return Colors.brown.shade300;
    }
  }
}
