
class Move {
  int score;
  int index;
  Move({this.score = 0, required this.index});

  static Move minimiser(List<String> s, int depth) {
    if (isEndState(s)) {
      return Move(score: getScore(s, depth), index: -1);
    }

    Move min = Move(score: 1000, index: -1);
    for (int i = 0; i < 9; i++) {
      if (s[i] == '') {
        s[i] = 'X';
        Move curr = maximiser(s, depth + 1);
        if (curr.score < min.score) {
          min.score = curr.score;
          min.index = i;
        }
        s[i] = '';
      }
    }
    return min;
  }

  static Move maximiser(List<String> s, int depth) {
    if (isEndState(s)) {
      return Move(score: getScore(s, depth), index: -1);
    }

    Move max = Move(score: -1000, index: -1);
    for (int i = 0; i < 9; i++) {
      if (s[i] == '') {
        s[i] = 'O';
        Move curr = minimiser(s, depth + 1);
        if (curr.score > max.score) {
          max.score = curr.score;
          max.index = i;
        }
        s[i] = '';
      }
    }
    return max;
  }

  static int findResult(List<String> game) {
    for (int i = 0; i < 9; i += 3) {
      if ((game[i] == game[i + 1]) &&
          (game[i + 1] == game[i + 2]) &&
          (game[i] != '')) {
        if (game[i] == 'O') {
          return 1;
        } else if (game[i] == 'X') {
          return 2;
        }
      }
    }

    for (int i = 0; i < 3; i++) {
      if ((game[i] == game[i + 3]) &&
          (game[i + 3] == game[i + 6]) &&
          (game[i] != '')) {
        if (game[i] == 'O') {
          return 1;
        } else if (game[i] == 'X') {
          return 2;
        }
      }
    }

    if ((game[0] == game[4]) && (game[4] == game[8]) && (game[0] != '')) {
      if (game[0] == 'O') {
        return 1;
      } else if (game[0] == 'X') {
        return 2;
      }
    } else if (game[2] == game[4] && game[4] == game[6] && game[2] != '') {
      if (game[2] == 'O') {
        return 1;
      } else if (game[2] == 'X') {
        return 2;
      }
    }

    for (int i = 0; i < 9; i++) {
      if (game[i] == '') {
        return -1;
      }
    }

    return 0;
  }

  static bool isEndState(List<String> s) {
    var temp = findResult(s);
    if (temp == -1) {
      return false;
    }
    return true;
  }

  static int getScore(List<String> s, int depth) {
    int res = findResult(s);
    if (res == 1) {
      return (10 + depth);
    } else if (res == 2) {
      return (depth - 10);
    }
    return 0;
  }
}