import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/move.dart';


class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> game = List.filled(9, '');
  bool gameOver = false;
  int moves = 0;
  int result = 0;

  gameMove() {
    if (!gameOver) {
      Move best = Move.minimiser(game, 0);
      debugPrint("Game sets -> ${best.index}");
      setState(() {
        game[best.index] = 'X';
        moves++;
      });
      checkVictory();
    }
  }

  void onClick(int index) {
    if (game[index] == '') {
      setState(() {
        game[index] = 'O';
        moves++;
      });
      checkVictory();
      gameMove();
    }
  }

  void reset() {
    setState(() {
      game.fillRange(0, 9, '');
      gameOver = false;
      moves = 0;
      result = 0;
    });
  }

  void checkVictory() {
    debugPrint(game.toString());
    debugPrint(Move.isEndState(game).toString());
    int res = Move.findResult(game);
    if (res != -1) {
      setState(() {
        result = res;
        gameOver = true;
      });
    }
  }

  Widget getTile(int index, String text) {
    return Container(
        decoration: BoxDecoration(border: getBorders(index: index)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w400),
          ),
        ));
  }

  Border getBorders({
    required int index,
    BorderSide borderSide = const BorderSide(width: 5, color: Colors.grey),
  }) {
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
        return Border.all(width: 5, color: Colors.grey);
      case 5:
        return Border(top: borderSide, bottom: borderSide, left: borderSide);
      case 6:
        return Border(top: borderSide, right: borderSide);
      case 7:
        return Border(top: borderSide, left: borderSide, right: borderSide);
      case 8:
        return Border(top: borderSide, left: borderSide);
    }
    return Border.all(width: 5, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                width: kIsWeb
                    ? MediaQuery.of(context).size.width > 300
                        ? 300
                        : MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width,
                child: GridView.count(
                  padding:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        if (!gameOver) {
                          onClick(index);
                        }
                      },
                      child: getTile(index, game[index]),
                    );
                  }),
                ),
              )),
              if (gameOver)
                Padding(
                    padding: const EdgeInsets.only(
                      bottom: 96.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        reset();
                      },
                      child: const Text('เริ่มเล่นใหม่ อีกครั้ง!',
                          style: TextStyle(color: Colors.blue, fontSize: 25.0)),
                    )),
            ],
          )
        ],
      ),
    );
  }
}
