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

  void _incrementCounter() {
    setState(() {
      _counter++;
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
                fontSize: 36,          // Adjust the font size
                fontWeight: FontWeight.bold, // Use a bold font weight
                color: Colors.white,   // Set the text color
                shadows: [
                  Shadow(
                    color: Colors.grey, // Shadow color
                    offset: Offset(2, 2), // Shadow offset
                    blurRadius: 5,       // Shadow blur radius
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(),
                _buildSquare(),
                _buildSquare(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(),
                _buildSquare(),
                _buildSquare(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquare(),
                _buildSquare(),
                _buildSquare(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquare() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ElevatedButton(
        onPressed: () {
          // Add your button tap logic here
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white.withOpacity(0.3),
          shadowColor: Colors.yellow,
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(fontSize: 36),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: const Text('O'), // Replace with 'O' or '' as needed
      ),
    );
  }

  void _onMove() {}

  String _statusText() {
    return "Please Begin";
  }
}
