import 'package:flutter/material.dart';
import 'package:flutter_project/player.dart';
import 'package:flutter_project/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const countMatrix = 3;
  static const double size = 92;

  late List<List<String>> matrix;

  String lastMove = Player.none;
  @override
  void initState() {
    super.initState();
    setEmptyFields();
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
        countMatrix,
        (index) => List.generate(countMatrix, (i) => Player.none),
      ));

  Color getFieldColor(String value) {
    switch (value) {
      case Player.O:
        return Colors.blue;
      case Player.X:
        return Colors.red;
      default:
        return Colors.white70;
    }
  }

  Color getBackgroundColor() {
    final thisMove = lastMove == Player.X ? Player.O : Player.X;
    return getFieldColor(thisMove).withAlpha(150);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
      ),
    );
  }

  Widget buildRow(int x) {
    final values = matrix[x];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        values,
        (y, value) => buildField(x, y),
      ),
    );
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];
    final color = getFieldColor(value);
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(size, size),
          primary: color,
          // onSurface: color,
          // onSurface: Colors.green,
        ),
        onPressed: () => selectField(value, x, y),
        child: Text(
          value,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      String newValue = lastMove == Player.X ? Player.O : Player.X;
      setState(() {
        lastMove = newValue;
        matrix[x][y] = newValue;
      });

      if (isWinner(x, y)) {
        showEndDialog('Player $newValue : Won');
      } else if (isEnd()) {
        showEndDialog('เสมอกันนะค่ะ');
      }
    }
  }

  bool isEnd() =>
      matrix.every((values) => values.every((value) => value != Player.none));

  bool isWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix[x][y];
    const n = countMatrix;

    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) {
        col++;
      }
      if (matrix[i][y] == player) {
        row++;
      }
      if (matrix[i][i] == player) {
        diag++;
      }
      if (matrix[i][n - i - 1] == player) {
        rdiag++;
      }
    }
    return row == n || col == n || diag == n || rdiag == n;
  }

  Future showEndDialog(String title) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: const Text('Press to Restart new Game'),
        actions: [
          ElevatedButton(
            onPressed: () {
              setEmptyFields();
              Navigator.pop(context);
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
