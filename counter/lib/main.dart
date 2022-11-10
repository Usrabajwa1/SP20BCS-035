// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(

  home: Scaffold(
    backgroundColor: Colors.amberAccent,
    appBar:AppBar(
      title: Text("Counter"),
    ),
    body: Counter(),
  ),
));
class Counter extends StatefulWidget{
  const Counter({Key?key}) : super(key: key);
  @override
  _CounterState createState()=> _CounterState();


}
class _CounterState extends State<Counter>{
  int count=0;
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("$count",style:TextStyle(fontSize:150),),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[

            FloatingActionButton.extended(onPressed:(){
              setState((){
                count=0;
              }
              );
            },
              label:Text("Reset"),icon:Icon(Icons.refresh),),
            FloatingActionButton.extended(onPressed:(){
              setState((){
                count=count+1;

              }
              );
            },label:Text("Add"),icon:Icon(Icons.add),),
            FloatingActionButton.extended(onPressed:(){
              setState((){
                count=count-1;

              }
              );
            },label:Text("Add"),icon:Icon(Icons.remove),),



          ],
        )
      ],
    );
  }
}

