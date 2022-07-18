import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> games = List.filled(9, "");

  bool isSwitchPlayer = true;
  bool isGameOver = false;

  List<int> matchIndexs = [];

  void _playGame(int index) {
    setState(() {
      isSwitchPlayer ? games[index] = "O" : games[index] = "X";
      isSwitchPlayer = !isSwitchPlayer;

      _checkWinner();
    });
  }

  void _reset() {
    setState(() {
      // games = List.filled(9, "");
      games.fillRange(0, 9, "");
      isGameOver = false;
      matchIndexs = [];
    });
  }

  void _checkWinner() {
    if (games[0] == games[1] && games[0] == games[2] && games[0] != "") {
      matchIndexs = [0, 1, 2];
      _showWinnerDialog();
    }
    if (games[3] == games[4] && games[3] == games[5] && games[3] != "") {
      matchIndexs = [3, 4, 5];
      _showWinnerDialog();
    }
    if (games[6] == games[7] && games[6] == games[8] && games[6] != "") {
      matchIndexs = [6, 7, 8];
      _showWinnerDialog();
    }
    if (games[0] == games[3] && games[0] == games[6] && games[0] != "") {
      matchIndexs = [0, 3, 6];
      _showWinnerDialog();
    }
    if (games[1] == games[4] && games[1] == games[7] && games[1] != "") {
      matchIndexs = [1, 4, 7];
      _showWinnerDialog();
    }
    if (games[2] == games[5] && games[2] == games[8] && games[2] != "") {
      matchIndexs = [2, 5, 8];
      _showWinnerDialog();
    }
    if (games[0] == games[4] && games[0] == games[8] && games[0] != "") {
      matchIndexs = [0, 4, 8];
      _showWinnerDialog();
    }
    if (games[2] == games[4] && games[2] == games[6] && games[2] != "") {
      matchIndexs = [2, 4, 6];
      _showWinnerDialog();
    }
  }

  void _showWinnerDialog() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: games.length,
          itemBuilder: (BuildContext context, int index) {
            return _cell(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        shape: const CircleBorder(),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _cell(int index) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: getBorders(index),
      ),
      child: ElevatedButton(
        onPressed: () => _playGame(index),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          onPrimary: Theme.of(context).colorScheme.surfaceTint,
          primary: matchIndexs.contains(index) ? Colors.red : Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          games[index],
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  Border getBorders(int index) {
    BorderSide borderSide = const BorderSide(width: 2, color: Colors.grey);
    Border borderAll = Border.all(width: 2, color: Colors.grey);
    switch (index) {
      case 0:
        return Border(bottom: borderSide, right: borderSide);
      case 1:
        return Border(bottom: borderSide, left: borderSide, right: borderSide);
      case 2:
        return Border(bottom: borderSide, left: borderSide);
      case 3:
        return Border(top: borderSide, bottom: borderSide, right: borderSide);
      case 4:
        return borderAll;
      case 5:
        return Border(top: borderSide, bottom: borderSide, left: borderSide);
      case 6:
        return Border(top: borderSide, right: borderSide);
      case 7:
        return Border(top: borderSide, left: borderSide, right: borderSide);
      case 8:
        return Border(top: borderSide, left: borderSide);
    }
    return borderAll;
  }
}
