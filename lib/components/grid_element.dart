import 'package:fl_puzz/components/target_box.dart';
import 'package:fl_puzz/components/dragable_card.dart';
import 'package:fl_puzz/providers/element_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          return TargetBox(x: x, y: y);
        }
        return Draggable<List<int>>(
          child: DragableCard(i: val),
          childWhenDragging: const Card(
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 60,
              ),
            ),
          ),
          data: [x, y],
          feedback: Card(
            color: _getColor(eP.board[x][y]),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                height: MediaQuery.of(context).size.width < 700
                    ? MediaQuery.of(context).size.width / 30
                    : MediaQuery.of(context).size.width / 25,
                width: MediaQuery.of(context).size.width < 700
                    ? MediaQuery.of(context).size.width / 30
                    : MediaQuery.of(context).size.width / 25,
                child: Center(
                  child: Text(
                    '$val',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
