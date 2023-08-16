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
  final _squares = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];



  void _incrementCounter(int id, String c) {
    setState(() {
      _counter++;
      _squares[id] = c;
    });
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
        width: double.maxFinite,
        height: double.maxFinite,
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
          ],
        ),
      ),
    );
  }

  Widget _buildSquare(int id) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ElevatedButton(
        onPressed: () =>_onMove(id),
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
    print(id);
    print(_squares);
    print(_counter);
    if (_squares[id] == ' ') {
      _incrementCounter(id, _counter % 2 == 0 ? 'O' : 'X');

    }
    print(_squares);
  }

  String _statusText() {
    return "Please Begin";
  }
}
