import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(

  home:
  Scaffold(
    backgroundColor: Colors.teal,
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

        Text("$count",style:TextStyle(fontSize:150,color: Colors.teal),),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[

            FloatingActionButton.extended(onPressed:(){
              setState((){
                count=count+1;

              }
              );
            },label:Text("Add"),icon:Icon(Icons.add),),



          ],
        )
      ],
    );
  }
}
