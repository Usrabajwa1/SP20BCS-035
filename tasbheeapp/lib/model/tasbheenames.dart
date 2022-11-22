import 'package:flutter/material.dart';

class TasbheeNames extends StatelessWidget {
  String ?_itemName;
  String ?_dateCreate;
  int ? _id;

  TasbheeNames(this._itemName,this._dateCreate);

  TasbheeNames.map(dynamic obj){
    this._itemName = obj["itemName"];
    this._dateCreate =obj["dateCreate"];
    this._id = obj["id"];
  }

  String? get itemName => _itemName;
  String? get dateCreate=> _dateCreate;
  int ? get id=> _id;

  Map<String , dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["itemName"] = _itemName;
    map["dateCreate"] = _dateCreate;

    if(_id !=null){
      map["id"]= _id;
    }
    return map;
  }

  TasbheeNames.fromMap(Map<String, dynamic>map){
    this._itemName = map["itemName"];
    this._dateCreate =  map["dateCreate"];
    this._id= map["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _itemName!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.9
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Created on : $_dateCreate",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12.5,
                      fontStyle: FontStyle.italic),

                ),
              ),

            ],
          )

        ],
      ),
    );
  }
}
