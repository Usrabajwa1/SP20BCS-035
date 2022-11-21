import 'package:flutter/material.dart';
import 'package:tasbheeapp/model/tasbheenames.dart';
import 'package:tasbheeapp/util/database.dart';
class TasbheeScreen extends StatefulWidget {

  @override
  State<TasbheeScreen> createState() => _TasbheeScreenState();
}

class _TasbheeScreenState extends State<TasbheeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  var db = new DatabaseHelper();
  final List<TasbheeNames> _itemList = <TasbheeNames>[];
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

  void _ShowdDialogForm() async {
    var alert = AlertDialog(
      content: Row(
        children: [
          Expanded(child: TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "Item",
                hintText: "eg. Don't ",
                icon: Icon(Icons.note_add)
            ),
          ))

        ],
      )
      actions: <Widget>[
        Textbutton(
     onPressed: (){
       _handleSubmitted(_textEditingController.text);
       _textEditingController.clear();
       Navigator.pop(context);

    },
    )
        ]
    ),
    showDialog(
    context: context,
        builder: (_)
    {
        return alert;
    }
    );
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();
    TasbheeNames tasbheenames = TasbheeNames(text, DateTime.now().toIso8601String());
    int savedItem = await db.saveItem(tasbheenames);
    TasbheeNames addedItem = await db.getItem(savedItem);
    setState(() {
      _itemList.insert(0,addedItem);
    });
    print("Item saved id : $savedItem")
    ;
  }
}
