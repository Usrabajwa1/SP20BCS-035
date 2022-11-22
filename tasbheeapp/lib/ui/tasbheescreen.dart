import 'package:flutter/material.dart';
import 'package:tasbheeapp/model/tasbheenames.dart';
import 'package:tasbheeapp/util/database.dart';
import 'package:tasbheeapp/ui/tasbheescreen.dart';
import 'counter.dart';
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
      body: SafeArea(
        child: Column(
          children:[
            Container(
            child:
            GestureDetector(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Counter(),));


              },
              child: Container(
                child: Center(
                  child: Text(
                    'Do tasbhee',

                  ),
                ),
                color: Colors.purpleAccent,
                height: 80
                ,


              ),
            ),
          ),
            Container(
              color: Colors.indigoAccent,
              child: TextButton(


                child: new ListTile(
                  title:Center(
                          child: Text("Create new tasbhee"),
    )

                ),
                onPressed: _ShowdDialogForm,
              ),

              ) ,


          ]

        ),
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
                  labelText: "Tasbhee",
                  hintText: "Create tasbhee ",
                  icon: Icon(Icons.note_add)
              ),
            ))

          ],
        ),
        actions: [
         TextButton(
            onPressed:() {
              //handleSubmitted(_textEditingController.text);
              _textEditingController.clear();
              Navigator.pop(context);
            }, child: Text("Save"),

          ),
        ]


    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        }

    );

    void handleSubmitted(String? text) async {
      _textEditingController.clear();
      TasbheeNames tasbheenames = TasbheeNames(
          text, DateTime.now().toIso8601String());
      int savedItemId = await db.saveItem(tasbheenames);
      TasbheeNames? addedItem = await db.getItem(savedItemId);
      setState(() {
        _itemList.insert(0, addedItem!);
      });
      print("Item saved id : $savedItemId")
      ;
    }
  }
}

