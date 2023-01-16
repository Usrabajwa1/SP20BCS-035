import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatefulWidget {
  @override
  _TutorialHomeState createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  int _guessNumber = Random().nextInt(100);
  final TextEditingController _userInput = TextEditingController();
  String _currentMessage = '';
  bool _validate = false;

  void _checkNumber() {
    final int _userInt = int.parse(_userInput.text);
    if (_guessNumber == int.parse(_userInput.text)) {
      setState(() {
        _currentMessage =
        'You guessed $_userInt . Congrats!!!\nYou want to try again? Go on!';
        _guessNumber = Random().nextInt(100);
      });
    } else if (_guessNumber > int.parse(_userInput.text)) {
      setState(() {
        _currentMessage = 'You guessed $_userInt\nTry a HIGHER number!';
      });
    } else if (_guessNumber < int.parse(_userInput.text)) {
      setState(() {
        _currentMessage = 'You guessed $_userInt\nTry a LOWER number!';
      });
    }
    _userInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          'Guessing Game ',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'guess a number between 1 and 100. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                wordSpacing: 5,
              ),
            ),
          ),
          const Text(
            'your turn to guess number',
          ),
          Text(
            _currentMessage,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              wordSpacing: 5,
            ),
          ),
          Card(
            color: Colors.pink,
            elevation: 15,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Select a Number!',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      controller: _userInput,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Guess',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        _userInput.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                      if (_validate == false) {
                        _checkNumber();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}