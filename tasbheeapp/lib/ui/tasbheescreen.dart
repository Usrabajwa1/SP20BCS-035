import 'package:flutter/material.dart';
class TasbheeScreen extends StatefulWidget {
  const TasbheeScreen({Key? key}) : super(key: key);

  @override
  State<TasbheeScreen> createState() => _TasbheeScreenState();
}

class _TasbheeScreenState extends State<TasbheeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton:
      FloatingActionButton(
        tooltip: "add item",
        backgroundColor: Colors.blue,
        child: new ListTile(
          title: new Icon(Icons.add),
        ),
        onPressed: _ShowdDialogForm,
      ),
    );
  }

  void _ShowdDialogForm() {
  }
}
