import 'package:fl_puzz/components/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'target_box.dart';
import 'dragable_card.dart';
import '../providers/game_provider.dart';

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
    return Consumer<GameProvider>(
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
            childWhenDragging: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xFF012345),
                shadowColor: Colors.white,
                child: const CustomBox()),
            data: [x, y],
            feedback: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.white,
              color: Utils.getElementColor(eP.board[x][y]),
              child: const CustomBox(),
            ),
          ),
        );
      },
    );
  }
}
