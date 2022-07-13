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
