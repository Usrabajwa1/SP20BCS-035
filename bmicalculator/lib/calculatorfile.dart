import 'dart:math';
import 'input_page.dart';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int ? height;
  final int ? weight;
  double  _bmi =1;


  String  calulatorBMI(){

    _bmi =( weight! / pow(height! / 100,2));
    return _bmi.toStringAsFixed(1);
  }
  String  getResult(){
    if(_bmi >= 25){
      return'normal';
    }
    else{
      return 'underweight';
    }
  }
  String  getInterpretation(){
    if(_bmi >= 25){
      return 'you have higher than normal body weight! try exercise';
    }
    else if(_bmi >= 18.5){
      return'you have higher than normal body weight!good job';
    }else
      {
        return'you have lower than normal body weight! you can eat more..';
      }
  }

}