import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  colors: Colors.blueGrey,
                  cardWidget: Column(
                   children: <Widget>[
                     Icon(
                       FontAwesomeIcons.female,
                       size: 80.0,
                     ),
                     SizedBox(
                       height: 15.0,
                     ),
                     Text('Male')

                   ],
                  ),
                ),
              ),
              Expanded(child:
              RepeatContainerCode(
                colors: Colors.blueGrey,
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

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors, this.cardWidget});
 final Color colors;
 final Widget cardWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(15.0),
      child: cardWidget,
      decoration: BoxDecoration(
        color:colors,
        borderRadius: BorderRadius.circular(10.0),
      ),
              );
  }
}

