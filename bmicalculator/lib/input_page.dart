import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconeTextFile.dart';
import 'ContainerFile.dart';
const activeColor = Color(0xFF607D8B);
const deActiveColor= Color(0xFF4A148C);
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = deActiveColor;
  Color femaleColor = deActiveColor;

  void updateColor(int gender){
    if(gender==1){
      femaleColor = activeColor;
      maleColor = deActiveColor;
    }
    if(gender==2){
      maleColor = activeColor;
      femaleColor = deActiveColor;
    }


  }
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
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(1);
                    });
                  },
                  child: RepeatContainerCode(
                    colors: femaleColor,
                    cardWidget: RepeatTextandICONeWidget(
                      iconData: FontAwesomeIcons.female,
                      label: 'Female',
                    ),
                  ),
                ),
              ),
              Expanded(child:
              GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(2);
                  });
                },
                child: RepeatContainerCode(
                  colors: maleColor,
                  cardWidget: RepeatTextandICONeWidget(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),
                ),
              ),),

            ],
          ),),
          Expanded(child:
          RepeatContainerCode(
            colors: Colors.blueGrey,
          ),),
          Expanded(child: Row(
          children: <Widget>[
          Expanded(child:
          RepeatContainerCode(
            colors: Colors.blueGrey,
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



