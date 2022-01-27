import 'package:fl_puzz/providers/element_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TargetBox extends StatelessWidget {
  final int x;
  final int y;
  const TargetBox({
    Key? key,
    required this.x,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<List<int>>(
      
      onAccept: (data) {
        print(data);
        print("$x, $y");
        Provider.of<ElementProvider>(context, listen: false)
            .swapBoardElement(x1: data[0], y1: data[1], x2: x, y2: y);
      },
      onWillAccept: (data) {
        print('Will accept $data');
        return true;
      },
      onLeave: (data) {
        print('Left $data');
      },
      builder: (context, candidateData, rejectedData) {
        if (candidateData.isEmpty) {
          return const Card(
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 60,
              ),
            ),
          );
        }
        return const Card(
          color: Colors.grey,
          child: Center(
            child: SizedBox(
              height: 60,
              width: 60,
            ),
          ),
        );
      },
    );
  }
}
