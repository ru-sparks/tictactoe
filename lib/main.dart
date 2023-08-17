import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const TicTacToePage(title: 'Tic Tac Toe'),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key, required this.title});

  final String title;

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  int _counter = 0;
  var _squares = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
  var _winner = ' ';

  final _winningCombos = [
    // rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // columns
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // diagonals
    [0, 4, 8],
    [6, 4, 2],
  ];

  void _updateState(int id, String c) {
    setState(() {
      _counter++;
      _squares[id] = c;
      _winner = _checkForWin();
    });
  }

  void _resetState() {
    setState(() {
      _counter = 0;
      _squares = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
      _winner = ' ';
    });
  }

  String _checkForWin() {
    var rc = ' ';
    for (int i = 0; i < _winningCombos.length; i++) {
      if (_squares[_winningCombos[i][0]] != ' ' &&
          _squares[_winningCombos[i][0]] == _squares[_winningCombos[i][1]] &&
          _squares[_winningCombos[i][0]] == _squares[_winningCombos[i][2]]) {
        rc = _squares[_winningCombos[i][0]];
        break;
      }
    }
    return rc;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the TicTacToePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _statusText(),
              style: const TextStyle(
                fontSize: 36, // Adjust the font size
                fontWeight: FontWeight.bold, // Use a bold font weight
                color: Colors.white, // Set the text color
                shadows: [
                  Shadow(
                    color: Colors.grey, // Shadow color
                    offset: Offset(2, 2), // Shadow offset
                    blurRadius: 5, // Shadow blur radius
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(0),
                _buildSquare(1),
                _buildSquare(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(3),
                _buildSquare(4),
                _buildSquare(5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(6),
                _buildSquare(7),
                _buildSquare(8),
              ],
            ),
            _buildResetButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSquare(int id) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () => _onMove(id),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white.withOpacity(0.6),
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(fontSize: 36),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text(_squares[id]), // Replace with 'O' or '' as needed
      ),
    );
  }

  void _onMove(int id) {
    if (_squares[id] == ' ' && _winner == ' ') {
      _updateState(id, _counter % 2 == 0 ? 'O' : 'X');
    }
  }

  String _statusText() {
    var status = _counter == 0
        ? "'O' goes first"
        : (_counter % 2 == 0 ? "Next turn: 'O'" : "Next turn: 'X'");
    if (_winner != ' ') {
      status = "'$_winner' Wins!";
    } else if (_counter == 9) {
      status = "Cat's Game";
    }
    return status;
  }

  Widget _buildResetButton() {
    return Visibility(
      visible: _counter == 9 || _winner != ' ',
      child: ElevatedButton(
        onPressed: _resetState,
        child: const Text("New Game"),
      ),
    );
  }
}
