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
      body: Column(
        children: [
          Flexible(child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: false,
            itemCount: _itemList.length,
            itemBuilder: (_, int index){
              return Card(
                color: Colors.black45,
                child: ListTile(
                  title: _itemList[index],
                  trailing: new Listener(
                    key: new Key (_itemList[index].itemName!),
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.teal,
                    ),
                  )
                ),
              );
            },
          )
          ),
          Divider(
            height: 1.0,
          )
        ],
      ),
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
      ),
     actions: [
        FloatingActionButton(
        onPressed: (){
      _handleSubmitted(_textEditingController.text);
      _textEditingController.clear();
      Navigator.pop(context);

    },
    ),
        ]


    );
    showDialog(

    context: context,
        builder: (_),
        {
        return alert;
        }
    );
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();
    TasbheeNames tasbheenames = TasbheeNames(text, DateTime.now().toIso8601String());
    int savedItem = await db.saveItem(tasbheenames);
    Null addedItem = await db.getItem(savedItem);
    setState(() {
      _itemList.insert(0,addedItem!);
    });
    print("Item saved id : $savedItem")
    ;
  }
}
