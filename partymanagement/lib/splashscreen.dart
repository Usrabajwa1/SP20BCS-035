import 'dart:async';
import 'homepage.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Saplashpage extends StatefulWidget {
  @override
  State<Saplashpage> createState() => _SaplashpageState();
}

class _SaplashpageState extends State<Saplashpage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration:
        BoxDecoration(
        image:
        DecorationImage(
        image: AssetImage("images/splash2.jpg"),
    fit: BoxFit.cover,


    )
    ) ,
        child: Center(
          child:CircleAvatar(
            radius: 140,
            backgroundColor: Colors.purple,
            child: Padding(
              padding: const EdgeInsets.all(8), // Border radius
              child: ClipOval(child: Image.network('images/img.png')),
            ),
          )





      ) ,
      );
  }
}