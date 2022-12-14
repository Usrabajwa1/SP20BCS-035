import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconeTextFile.dart';
import 'ContainerFile.dart';
import 'constantfile.dart';
import 'resultfile.dart';
import 'calculatorfile.dart';
enum Gender {
  male,
  female,
}
class input extends StatelessWidget {
  const input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class InputPage extends StatefulWidget {

InputPage({
  @required this.interpretation,
});
final String ? interpretation;
  @override
  State<InputPage> createState() => _InputPageState();

}

class _InputPageState extends State<InputPage> {
  Gender ? selectGender;
  int sliderHeight=180;
  int sliderWeight=60;
  int sliderAge=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[

              Expanded(

                  child: RepeatContainerCode(
                    onPressed: (){
                      setState(() {
                        selectGender=Gender.female;
                      });
                    },
                    colors: selectGender==Gender.female
                        ? activeColor
                        : deActiveColor,
                    cardWidget: RepeatTextandICONeWidget(
                      iconData: FontAwesomeIcons.female,
                      label: 'Female',
                    ),
                  ),

              ),
              Expanded(

                child: RepeatContainerCode(
                  onPressed: (){
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                  colors: selectGender==Gender.male
                      ? activeColor
                      : deActiveColor,
                  cardWidget: RepeatTextandICONeWidget(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),
                ),

              ),

            ],
          ),),
          Expanded(child:
          RepeatContainerCode(
            colors: Colors.blueGrey,
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'HEIGHT',
                    style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      sliderHeight.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                        'cm',
                        style: kLabelStyle,
                    ),

                  ],
                ),
                Slider(
                  value: sliderHeight.toDouble(),
                  min:120.0,
                  max: 220.0,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                    setState(() {
                      sliderHeight= newValue.round();
                    });
                  },
                ),

              ],
            ),
          ),),
          Expanded(child: Row(
          children: <Widget>[
          Expanded(child:
          RepeatContainerCode(
            colors: Colors.blueGrey,
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'WEIGHT',
                style: kLabelStyle,
                ),
                Text(
                    sliderWeight.toString(),
                    style: kNumberStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundIcon(
                      iconData:FontAwesomeIcons.minus ,
                      onPress: (){
                        setState(() {
                          sliderWeight--;
                        }
                        );
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RoundIcon(
                      iconData:FontAwesomeIcons.plus ,
                      onPress: (){
                        setState(() {
                          sliderWeight++;
                        }
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),),
          Expanded(child:
          RepeatContainerCode(
            colors: Colors.blueGrey,
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'AGE',
                  style: kLabelStyle,
                ),
                Text(
                  sliderAge.toString(),
                  style: kNumberStyle,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundIcon(
                      iconData:FontAwesomeIcons.minus ,
                      onPress: (){
                        setState(() {
                          sliderAge--;
                        }
                        );
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RoundIcon(
                      iconData:FontAwesomeIcons.plus ,
                      onPress: (){
                        setState(() {
                          sliderAge++;
                        }
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),),


        ],
      ),),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: sliderHeight,weight: sliderWeight);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(
                    bmiResult: calc.calulatorBMI(),
                    resultText: calc.getResult(),
                  //  interpretation: calc.getInterpretation(),
                  )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'calculate',
                style: kLargeButtonstyle,
                ),
              ),
              color: Colors.indigoAccent,
              margin: EdgeInsets.only(top:10.0),
              width: double.infinity,
                height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
 RoundIcon({@required this.iconData,@required this.onPress});
 final IconData ? iconData;
 final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(iconData),
        onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.black26,
    );
  }
}




