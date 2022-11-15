import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ai.dart';
import 'dart:math';

Random random = new Random();

void main() {
  runApp(const MyApp());
}

bool checker = false;
bool end = false;
bool s1v1 = false;
bool botTurn = false;
List<int> indices = [0, 0, 0, 0, 0, 0, 0, 0, 0];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const MyHomePage(
        title: 'Tic Tac Toe',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final EdgeInsets gap = const EdgeInsets.all(5);

  final List<Icon?> icons = [
    null,
    const Icon(
      Icons.circle_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.close,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(0, context),
                            child: icons[indices[0]],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(1, context),
                            child: icons[indices[1]],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(2, context),
                            child: icons[indices[2]],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(3, context),
                            child: icons[indices[3]],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(4, context),
                            child: icons[indices[4]],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(5, context),
                            child: icons[indices[5]],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(6, context),
                            child: icons[indices[6]],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(7, context),
                            child: icons[indices[7]],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: gap,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MaterialButton(
                            color: Colors.indigo,
                            onPressed: () => controlsTiles(8, context),
                            child: icons[indices[8]],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () => restartGame(),
              icon: Icon(Icons.replay),
              label: Text('Restart'),
            ),
            ElevatedButton.icon(
              onPressed: () => setEasyIa(),
              icon: Icon(Icons.gamepad),
              label: Text('IA easy'),
            ),
            ElevatedButton.icon(
              onPressed: () => set1V1(),
              icon: Icon(Icons.accessibility),
              label: Text('1V1'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void restartGame() {
    indices = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    end = false;
    setState(() {});
  }

  void setEasyIa() {
    s1v1 = false;
  }

  void set1V1() {
    s1v1 = true;
  }

  Future<void> _showMyDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('restart'),
              onPressed: () {
                restartGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  checkForWinner(BuildContext context) {
    //Define winning positions
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      int playerPosition0 = indices[winningPos[0]];
      int playerPosition1 = indices[winningPos[1]];
      int playerPosition2 = indices[winningPos[2]];

      if (playerPosition0 != 0) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          //all equal means player won
          if (playerPosition0 == 1) {
            _showMyDialog(context, "O won");
          } else {
            _showMyDialog(context, "X won");
          }
          end = true;
          return;
        }
      }
    }
  }

  checkForDraw(BuildContext context) {
    if (end) {
      return;
    }
    bool draw = true;
    for (var occupiedPlayer in indices) {
      if (occupiedPlayer == 0) {
        //at least one is empty not all are filled
        draw = false;
      }
    }

    if (draw) {
      _showMyDialog(context, "draw");
      end = true;
    }
  }

  void controlsTiles(int cella, BuildContext contex) {
    if (indices[cella] == 0 && checker == false) {
      setState(
        () => indices[cella] = 1,
      );
      checker = true;
      botTurn = true;
    } else if (indices[cella] == 0 && checker == true) {
      setState(
        () => indices[cella] = 2,
      );
      checker = false;
    }

    checkForWinner(context);
    checkForDraw(context);

    if (end) {
      restartGame();
    }

    if (botTurn && !s1v1) {
      botEasy(contex);
    }
  }

  void botEasy(BuildContext context) {
    if (!end) {
      int i = aiBoteasy();
      botTurn = false;
      controlsTiles(i, context);
    }
  }
}
