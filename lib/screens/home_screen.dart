import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/move.dart';

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

  void playGame(int index) {
    setState(() {
      isSwitchPlayer ? games[index] = "O" : games[index] = "X";
      isSwitchPlayer = !isSwitchPlayer;

      matchIndexs = Move.checkWinner(games).matchs;
      debugPrint(matchIndexs.toString());
    });
  }

  reset() {
    setState(() {
      // games = List.filled(9, "");
      games.fillRange(0, 9, "");
      isGameOver = false;
      matchIndexs = [];
    });
  }

  

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
        onPressed: reset,
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
        onPressed: () => playGame(index),
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
