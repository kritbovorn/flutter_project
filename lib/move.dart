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

  static Check checkWinner(List<String> games) {
    Check check = Check(player: 0, matchs: []);
    if (games[0] == games[1] && games[0] == games[2] && games[0] != "") {
      check.matchs = [0, 1, 2];
      if (games[0] == 'O') {
        check.player = 1;
        return check;
      } else if (games[0] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[3] == games[4] && games[3] == games[5] && games[3] != "") {
      check.matchs = [3, 4, 5];
      if (games[3] == 'O') {
        check.player = 1;
        return check;
      } else if (games[3] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[6] == games[7] && games[6] == games[8] && games[6] != "") {
      check.matchs = [6, 7, 8];
      if (games[6] == 'O') {
        check.player = 1;
        return check;
      } else if (games[6] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[0] == games[3] && games[0] == games[6] && games[0] != "") {
      check.matchs = [0, 3, 6];
      if (games[0] == 'O') {
        check.player = 1;
        return check;
      } else if (games[0] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[1] == games[4] && games[1] == games[7] && games[1] != "") {
      check.matchs = [1, 4, 7];
      if (games[1] == 'O') {
        check.player = 1;
        return check;
      } else if (games[1] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[2] == games[5] && games[2] == games[8] && games[2] != "") {
      check.matchs = [2, 5, 8];
      if (games[2] == 'O') {
        check.player = 1;
        return check;
      } else if (games[2] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[0] == games[4] && games[0] == games[8] && games[0] != "") {
      check.matchs = [0, 4, 8];
      if (games[0] == 'O') {
        check.player = 1;
        return check;
      } else if (games[0] == 'X') {
        check.player = 2;
        return check;
      }
    }
    if (games[2] == games[4] && games[2] == games[6] && games[2] != "") {
      check.matchs = [2, 4, 6];
      if (games[2] == 'O') {
        check.player = 1;
        return check;
      } else if (games[2] == 'X') {
        check.player = 2;
        return check;
      }
    }
    return check;
  }
}
