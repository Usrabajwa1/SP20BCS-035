import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('WeatherApp'),
        centerTitle: true,
      ),
      body: ,
    );
  }
}