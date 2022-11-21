import 'package:flutter/material.dart';

class TasbheeNames extends StatelessWidget {
  String ?_itemName;
  String ?_dateCreate;
  int ? _id;

  TasbheeNames(this._itemName,this._dateCreate),

  TasbheeNames.map(dynamic obj){
    this._itemName = obj["itemName"];
    this._dateCreate =obj["dateCreate"];
    this._id = obj["id"];
  }

  String? get itemName => _itemName;
  String? get dateCreate=> _dateCreate;
  int ? get id=> _id;

  Map<String , dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["itemName"] = _itemName;
    map["dateCreate"] = _dateCreate;

    if(_id !=null){
      map["id"]= _id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
