import 'package:flutter/material.dart';
import 'constantfile.dart';
import 'ContainerFile.dart';
import 'input_page.dart';
import 'calculatorfile.dart';
class ResultScreen extends StatelessWidget {
  ResultScreen({
  //  @required this.interpretation,
  @required this.resultText,
  @required this.bmiResult,
});

 final String ? bmiResult;
 final String ? resultText;
// final String ? interpretation;

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
            child: RepeatContainerCode(
              colors: deActiveColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText!.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResult!,

                    style: kBMiTextStyle,
                  ),

                ],
              )
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                CalculatorBrain calc=CalculatorBrain();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage(
                  interpretation: calc.getInterpretation(),
                )));
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
