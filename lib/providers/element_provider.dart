import 'package:flutter/material.dart';
import 'dart:math';

class ElementProvider extends ChangeNotifier {
  List<List<int>> board = [
    [6, 14, 4, 9],
    [1, 5, 8, 10],
    [3, 0, 7, 11],
    [12, 15, 2, 16]
  ];
  bool _completed = false;
  int steps = 0;

  bool get isCompleted => _completed;

  bool canMove({
    required int x1,
    required int y1,
    required int x2,
    required int y2,
  }) {
    if ((x1 == x2 && (y1 - y2).abs() == 1) ||
        (y1 == y2) && (x1 - x2).abs() == 1) {
      return true;
    }
    return false;
  }

  void swapBoardElement({
    required int x1,
    required int y1,
    required int x2,
    required int y2,
  }) {
    if (canMove(x1: x1, y1: y1, x2: x2, y2: y2)) {
      int t = board[x1][y1];
      board[x1][y1] = board[x2][y2];
      board[x2][y2] = t;
      steps++;
      checkCompletion();
    }
  }

  void checkCompletion() {
    print(steps);
    if (board[0][0] == 1 &&
        board[0][1] == 2 &&
        board[0][2] == 3 &&
        board[0][3] == 4 &&
        board[1][0] == 5 &&
        board[1][1] == 6 &&
        board[1][2] == 7 &&
        board[1][3] == 8 &&
        board[2][0] == 9 &&
        board[2][1] == 10 &&
        board[2][2] == 11 &&
        board[2][3] == 12 &&
        board[3][0] == 13 &&
        board[3][1] == 14 &&
        board[3][2] == 15) {
      _completed = true;
    }
    notifyListeners();
  }

  void refreshGame() {
    List<int> e = [];
    while (e.length < 16) {
      int r = Random().nextInt(16);
      if (!e.contains(r)) {
        e.add(r);
      }
    }
    
    board = [
      [e[0], e[1], e[2], e[3]],
      [e[4], e[5], e[6], e[7]],
      [e[8], e[9], e[10], e[11]],
      [e[12], e[13], e[14], e[15]],
    ];
    _completed = false;
    steps = 0;
    notifyListeners();
  }
}
