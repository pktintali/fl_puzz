import 'package:flutter/material.dart';

import '../utils.dart';
import 'custom_box.dart';

class DragableCard extends StatelessWidget {
  final int i;
  const DragableCard({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey,
      color: Utils.getElementColor(i),
      child: const CustomBox(),
    );
  }
}
