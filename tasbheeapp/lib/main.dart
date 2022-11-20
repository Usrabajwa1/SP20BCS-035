
import 'package:flutter/material.dart';

void main(){
  runApp(tasbheeapp());
}
class tasbheeapp extends StatelessWidget {
  const tasbheeapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarcreate(),
    );

  }
}
class AppBarcreate extends StatelessWidget {
  const AppBarcreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbheeapp'),
      ),
    );
  }
}

