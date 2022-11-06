import 'package:flutter/material.dart';
import 'constantfile.dart';
import 'ContainerFile.dart';
import 'input_page.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Result is',
                  style: kTitleText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RepeatContainer(
              colors: deActiveColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'normal',
                    style: kResultText,
                  ),
                  Text(
                    '18.3',
                    style: kBMiTextStyle,
                  ),
                  Text(
                    'BMI is lox you shuold have to work more',
                    textAlign: TextAlign.center,
                    style: kbodyTextStyle,
                  )
                ],
              )
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Recalculate',
                    style: kLargeButtonstyle,
                  ),
                ),
                color: Colors.indigoAccent,
                margin: EdgeInsets.only(top:10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ),
        ],
      )
    );
  }
}
