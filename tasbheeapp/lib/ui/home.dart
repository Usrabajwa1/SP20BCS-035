import 'package:flutter/material.dart';
import 'tasbheescreen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Text('Tasbhee App'),
        ),
        backgroundColor: Colors.teal,
      ),
      body: TasbheeScreen(),
    );
  }
}
