// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/ui/theme/color.dart';
import 'package:flutter_project/utils/game_logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = 'X';

  Game game = Game();

  bool isGameOver = false;

  int turn = 0;
  String result = "";
  List<int> scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    debugPrint('${game.board}');
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isGameOver ? '-- Finish --' : 'It is $lastValue turn'.toUpperCase(),
            style: TextStyle(
              color: isGameOver ? Colors.red : Colors.white,
              fontSize: isGameOver ? 40.0 : 42.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
                crossAxisCount: Game.boardLength ~/ 3,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(Game.boardLength, (index) {
                  return InkWell(
                    onTap: isGameOver
                        ? null
                        : () {
                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                isGameOver = game.winnerCheck(
                                    lastValue, index, 3, scoreBoard);
                                if (isGameOver) {
                                  result = '$lastValue is the Winner';
                                } else if (!isGameOver && turn == 9) {
                                  result = "เสมอกันนะค่ะ";
                                  isGameOver = true;
                                }

                                lastValue == "X"
                                    ? lastValue = "O"
                                    : lastValue = "X";
                              });
                            }
                          },
                    child: Container(
                      width: Game.blockSize,
                      height: Game.blockSize,
                      decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64,
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            result,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                game.board = Game.initGameBoard();
                isGameOver = false;
                turn = 0;
                result = "";
                scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text('Repeat the Game'),
            style: ElevatedButton.styleFrom(
              padding: isGameOver
                  ? const EdgeInsets.symmetric(vertical: 18, horizontal: 16)
                  : const EdgeInsets.symmetric(horizontal: 8),
              primary:
                  isGameOver ? Colors.orange.withOpacity(0.6) : Colors.green,
              // onSurface: isGameOver ? Colors.orange : Colors.green,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
