import 'package:flutter/material.dart';

class WeatherUI extends StatelessWidget {
  const WeatherUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image(
            image: AssetImage('images/umbrella.png'),
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
    );
  }
}