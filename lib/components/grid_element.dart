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
          return TargetBox(x: x, y: y);
        }
        return Draggable<List<int>>(
          child: DragableCard(i: val),
          rootOverlay: true,
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
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width < 700 ? 5 : 30),
              child: SizedBox(
                height: MediaQuery.of(context).size.width < 700
                    ? MediaQuery.of(context).size.width / 5.6
                    : MediaQuery.of(context).size.width / 25,
                width: MediaQuery.of(context).size.width < 700
                    ? MediaQuery.of(context).size.width / 5.6
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
