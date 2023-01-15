import 'package:flutter/material.dart';
import 'package:partymanagement/Collection.dart';
import 'package:partymanagement/parcipations.dart';
import 'splashscreen.dart';
import 'main.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body:homepage(),
      ),
    ),
  );
}
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}
class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(

    title: Center(
      child:  Text("Welcome and Farewell party"),
    ),


    backgroundColor:Colors.purple.shade700,
  ),
  body:
  Stack(
    children: [
      Container(
          decoration:
          BoxDecoration(
          image:
          DecorationImage(
          image: AssetImage("images/party.png"),
      fit: BoxFit.cover,)
    )
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, // foreground
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
              child: Text('participations'),
            ),
          ),
          Center(
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, // foreground
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => collection()));
              },
              child: Text('Total collection'),
            ),
          ),
          Center(
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, // foreground
              ),
              onPressed: () { },
              child: Text('how many paid fee for party'),
            ),
          ),
          Center(
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, // foreground
              ),
              onPressed: () { },
              child: Text('Total students wilingness in party'),
            ),
          ),







        ],
      ),


    ],

  ),

);
  }

}