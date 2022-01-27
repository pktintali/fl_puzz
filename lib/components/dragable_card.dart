import 'package:flutter/material.dart';

class DragableCard extends StatelessWidget {
  final int i;
  const DragableCard({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: _getColor(i),
      child: Center(
        child: Text(
          '$i',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Color _getColor(i) {
    if (i == 0) return Colors.white;

    if (i <= 4) return Colors.red;

    if (i <= 8) return Colors.blue;

    if (i <= 12) return Colors.brown;

    return Colors.green;
  }
}
