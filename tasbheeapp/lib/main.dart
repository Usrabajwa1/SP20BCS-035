
import 'package:flutter/material.dart';
import 'package:tasbheeapp/screen2.dart';
import 'ui/home.dart';
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
        title: Center(
       child: Text('Tasbheeapp'),
      ),),
      body:SafeArea(
        child: Center(
          child: Container(
            child:
            GestureDetector(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp(),));


              },
              child: Container(
                child: Center(
                  child: Text(
                    'Click for tasbhee',

                  ),
                ),
                color: Colors.teal,
                width:  160.0,
                height: 120.0,

              ),
            ),
          ),
        ),
      )

    );
  }
}

