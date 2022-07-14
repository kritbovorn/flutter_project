class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static const boardLength = 9;
  static const blockSize = 100.0;

  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool winnerCheck(
      String player, int index, int gridSize, List<int> scoreBoard) {
    int row = index ~/ 3;
    int column = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreBoard[row] += score;
    scoreBoard[gridSize + column] += score;

    if (row == column) scoreBoard[2 * gridSize] += score;
    if (gridSize - 1 - column == row) scoreBoard[2 * gridSize + 1] += score;

    if (scoreBoard.contains(3) || scoreBoard.contains(-3)) {
      return true;
    }

    return false;
  }
}
