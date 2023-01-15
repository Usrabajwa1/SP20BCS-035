import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: Saplashpage(),
  ));
}

class Saplashpage extends StatefulWidget {
  @override
  State<Saplashpage> createState() => _SaplashpageState();
}

class _SaplashpageState extends State<Saplashpage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => TutorialHome())));
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(
        backgroundColor: Colors.red,

        body: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.yellow,
                child: Text('GG',
                style:  TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  wordSpacing: 5,
                ),),

              ),
              Container(
                child: Text('Guessing Game',
                  style:  TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    wordSpacing: 5,
                  ),

                ),
              )

            ],
          )

      ),


      ),
      ),
    );




  }
}

