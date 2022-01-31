import 'package:fl_puzz/components/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'target_box.dart';
import 'dragable_card.dart';
import '../providers/element_provider.dart';

class GridElement extends StatelessWidget {
  final int x;
  final int y;
  const GridElement({
    Key? key,
    required this.x,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ElementProvider>(
      builder: (c, eP, child) {
        int val = eP.board[x][y];
        if (val == 0) {
          return AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(eP.padding),
            child: TargetBox(x: x, y: y),
          );
        }
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(eP.padding),
          child: Draggable<List<int>>(
            child: DragableCard(i: val),
            rootOverlay: true,
            childWhenDragging: const Card(
                color: Color(0xFF012345),
                shadowColor: Colors.white,
                child: CustomBox()),
            data: [x, y],
            feedback: Card(
              shadowColor: Colors.white,
              color: _getColor(eP.board[x][y]),
              child: const CustomBox(),
            ),
          ),
        );
      },
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
