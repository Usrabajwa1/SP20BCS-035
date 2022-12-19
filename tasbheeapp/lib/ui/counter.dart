import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbheeapp/ui/tasbheescreen.dart';

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
  var savedata;
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

            TextButton(
              onPressed:() async{
                  var sharedPref = await SharedPreferences.getInstance();
                 await sharedPref.setInt('count, count);
                  final prefs = await SharedPreferences.getInstance();

                final count = prefs.getInt('counter') ?? 0;

                Navigator.push(context,MaterialPageRoute(builder: (context)=>TasbheeScreen(),));


              },
              child: Text("Save"),
              ),







          ],
        )
      ],
    );
  }
}
