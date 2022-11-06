import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconeTextFile.dart';
import 'ContainerFile.dart';
import 'constantfile.dart';


enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender ? selectGender;
  int sliderHeight=180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR APP'),
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
              children: <Widget>[
                Text(
                    'WEIGHT',
                style: kLabelStyle,
                ),
              ],
            ),
          ),),
          Expanded(child:
          RepeatContainerCode(
            colors: Colors.blueGrey,
          ),),

        ],
      ),),
        ],
      ),
    );
  }
}



