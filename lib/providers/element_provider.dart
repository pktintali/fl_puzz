import 'package:flutter/material.dart';
import 'dart:math';

class ElementProvider extends ChangeNotifier {
  late List<List<int>> board = generateBoard(n: 4);
  bool _completed = false;
  int steps = 0;
  int size = 4;
  double padding = 0;
  double rotation = 0;

  List<int> getSizedList() {
    List<int> temp = [];
    temp.addAll(List.generate(size, (i) => i));
    return temp;
  }

  bool get isCompleted => _completed;

  void setSize(int n) {
    size = n;
    board = generateBoard(n: n);
    notifyListeners();
  }

  void setPadding(double p) {
    padding = p;
    notifyListeners();
  }

  void resetPadding() {
    padding = 0;
    notifyListeners();
  }

  void setRotation(double r) {
    rotation = r;
    notifyListeners();
  }

  void resetRotation() {
    rotation = 0;
    notifyListeners();
  }

  List<List<int>> generateBoard({int n = 4}) {
    size = n;
    List<List<int>> e = [];
    List<int> used = [];
    for (int i = 0; i < n; i++) {
      e.add([]);
      int r = Random().nextInt(n) + 1;
      while (used.contains(r)) {
        r = Random().nextInt(n) + 1;
      }
      used.add(r);
      for (int j = 0; j < n; j++) {
        e[i].add(r);
      }
    }
    e[Random().nextInt(n)][Random().nextInt(n)] = 0;
    for (int i = 0; i < n * n; i++) {
      int r1 = Random().nextInt(n);
      int r2 = Random().nextInt(n);
      if (r1 != r2) {
        int temp = e[r1][r2];
        e[r1][r2] = e[r2][r1];
        e[r2][r1] = temp;
      }
    }
    return e;
  }

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
    bool t1 = false, t2 = true, t3 = true;
    if (board[0][size - 1] == 0 ||
        board[size - 1][size - 1] == 0 ||
        board[0][0] == 0 ||
        board[size - 1][0] == 0) {
      t1 = true;
    }
    for (int i = 0; i < size; i++) {
      bool temp = true;
      for (int j = 0; j < size - 1; j++) {
        if (board[i][j] != 0 &&
            board[i][j + 1] != 0 &&
            (board[i][j] != board[i][j + 1])) {
          temp = false;
          break;
        }
      }
      if (temp == false) {
        t2 = false;
        break;
      }
    }
    for (int i = 0; i < size; i++) {
      bool temp = true;
      for (int j = 0; j < size - 1; j++) {
        if (board[j][i] != 0 &&
            board[j + 1][i] != 0 &&
            (board[j][i] != board[j + 1][i])) {
          temp = false;
          break;
        }
      }
      if (temp == false) {
        t3 = false;
        break;
      }
    }

    _completed = t1 && (t2 || t3);
    notifyListeners();
  }

  void refreshGame(int n) {
    board = generateBoard(n: n);
    _completed = false;
    steps = 0;
    notifyListeners();
  }
}
