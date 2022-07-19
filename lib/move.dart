import 'package:flutter_project/check.dart';

class Move {
  int score;
  int index;
  Move({
    required this.score,
    required this.index,
  });

  static bool isEndState(List<String> s) {
    var temp = checkWinner(s).player;
    if (temp == -1) {
      return false;
    }
    return true;
  }

  static int getScore(List<String> s, int depth) {
    int res = checkWinner(s).player;
    if (res == 1) {
      return (10 + depth);
    } else if (res == 2) {
      return depth - 10;
    }
    return 0;
  }

  static Move minimizer(List<String> s, int depth) {
    if (isEndState(s)) {
      return Move(score: getScore(s, depth), index: -1);
    }

    Move min = Move(score: 1000, index: -1);
    for (int i = 0; i < 9; i++) {
      if (s[i] == '') {
        s[i] = 'X';
        Move curr = maximizer(s, depth + 1);
        if (curr.score < min.score) {
          min.score = curr.score;
          min.index = i;
        }
        s[i] = '';
      }
    }
    return min;
  }

  static Move maximizer(List<String> s, int depth) {
    if (isEndState(s)) {
      return Move(score: getScore(s, depth), index: -1);
    }

    Move max = Move(score: -1000, index: -1);
    for (int i = 0; i < 9; i++) {
      if (s[i] == '') {
        s[i] = 'O';
        Move curr = minimizer(s, depth + 1);
        if (curr.score > max.score) {
          max.score = curr.score;
          max.index = i;
        }
        s[i] = '';
      }
    }
    return max;
  }

  static Check checkWinner(List<String> game) {
    Check checks = Check(player: 0, matchs: []);
    for (int i = 0; i < 9; i += 3) {
      if ((game[i] == game[i + 1]) &&
          (game[i + 1] == game[i + 2]) &&
          (game[i] != '')) {
        checks.matchs = [i, i + 1, i + 2];
        if (game[i] == 'O') {
          checks.player = 1;
          return checks;
        } else if (game[i] == 'X') {
          checks.player = 2;
          return checks;
        }
      }
    }

    for (int i = 0; i < 3; i++) {
      if ((game[i] == game[i + 3]) &&
          (game[i + 3] == game[i + 6]) &&
          (game[i] != '')) {
        checks.matchs = [i, i + 3, i + 6];
        if (game[i] == 'O') {
          checks.player = 1;
          return checks;
        } else if (game[i] == 'X') {
          checks.player = 2;
          return checks;
        }
      }
    }

    if ((game[0] == game[4]) && (game[4] == game[8]) && (game[0] != '')) {
      checks.matchs = [0, 4, 8];
      if (game[0] == 'O') {
        checks.player = 1;
        return checks;
      } else if (game[0] == 'X') {
        checks.player = 2;
        return checks;
      }
    } else if (game[2] == game[4] && game[4] == game[6] && game[2] != '') {
      checks.matchs = [2, 4, 6];
      if (game[2] == 'O') {
        checks.player = 1;
        return checks;
      } else if (game[2] == 'X') {
        checks.player = 2;
        return checks;
      }
    }

    for (int i = 0; i < 9; i++) {
      if (game[i] == '') {
        checks.player = -1;
        return checks;
      }
    }

    return checks;
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
}
