import 'package:flutter/material.dart';
import 'package:flutter_project/cell_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CellButton> buttonLists;

  late List player1;
  late List player2;
  late int activePlayer;

  @override
  void initState() {
    super.initState();

    buttonLists = doInit();
  }

  List<CellButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var cellButtons = <CellButton>[
      CellButton(id: 1),
      CellButton(id: 2),
      CellButton(id: 3),
      CellButton(id: 4),
      CellButton(id: 5),
      CellButton(id: 6),
      CellButton(id: 7),
      CellButton(id: 8),
      CellButton(id: 9),
    ];
    return cellButtons;
  }

  void playGame(CellButton cell) {
    setState(() {
      if (activePlayer == 1) {
        cell.title = "X";
        cell.backgroundColor = Colors.red;
        activePlayer = 2;
        player1.add(cell.id);
      } else {
        cell.title = "O";
        cell.backgroundColor = Colors.indigo;
        activePlayer = 1;
        player2.add(cell.id);
      }
      cell.enable = false;
    });
  }

  void checkWinner() {
    var winner = -1;
    // Row 1
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    // Row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    // Row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    // Colum 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    // Colum 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    // Colum 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    // Cross left to right
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    // Cross right to left
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {

      } else {
        
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 47, 39),
      // backgroundColor: const Color.fromARGB(255, 70, 41, 2),
      // backgroundColor: const Color.fromARGB(255, 53, 52, 50),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 87, 3),
        title: const Text('Tic Tac Toe'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: buttonLists.length,
        itemBuilder: (BuildContext context, int index) => SizedBox(
          child: ElevatedButton(
            onPressed: buttonLists[index].enable!
                ? () => playGame(buttonLists[index])
                : null,
            style: ElevatedButton.styleFrom(
                // primary: buttonLists[index].backgroundColor),
                // onPrimary: buttonLists[index].backgroundColor),
                onSurface: buttonLists[index].backgroundColor),
            // surfaceTintColor: buttonLists[index].backgroundColor),
            child: Text(
              buttonLists[index].title!,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
