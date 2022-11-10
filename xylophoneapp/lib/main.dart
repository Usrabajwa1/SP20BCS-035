import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main(){
  runApp(Myxyloo());

}
class Myxyloo extends StatelessWidget {
  const Myxyloo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("XyloApp"),
        ),
        body: Xylo(),
      ),
    );
  }
}
class Xylo extends StatefulWidget {
  const Xylo({Key? key}) : super(key: key);

  @override
  State<Xylo> createState() => _XyloState();
}

class _XyloState extends State<Xylo> {

  void PlaySound(int num){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/note$num.wav"),
    );
  }


  Expanded CreateNewButton(int sound, Color colur){
    return  Expanded(
      child: Container(
        color: colur,
        child: TextButton(onPressed: (){
          PlaySound(sound);

          },
            child: Text("Button 01")),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        CreateNewButton(1,Colors.teal),
        CreateNewButton(2,Colors.indigoAccent),
        CreateNewButton(3,Colors.pinkAccent),
        CreateNewButton(4,Colors.amberAccent),
        CreateNewButton(5,Colors.green),
        CreateNewButton(6,Colors.black26),
        CreateNewButton(7,Colors.purple),
    ],);
  }
}