import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String countryName = "Pakistan";
  String cityName = "Vehari";
  String degree = "0";


  String apikey= "afc26131632c8d14b920607f4f568941";

get units => null;



showWeather() async{

  String url =
      "http://api.openweathermap.org/data/2.5/weather?q=$cityName,$countryName,$units=metric&appid=$apikey";

  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    var items = jsonDecode(response.body);
    setState(() {
      degree = (items["main"]["temp"]).round().toString();
    });
  }


}





  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (val){
                  countryName = val;
                },
                decoration: const InputDecoration(
                  hintText: "country Name"
                ),
              ),
              const SizedBox(height:20),
               TextField(
                 onChanged: (val){
                   cityName = val;
                 },
                 decoration: const InputDecoration(
                   hintText: "City Name"
                 ),
               ),
              const SizedBox(height: 20),
              MaterialButton(
                height: 50,
                color: const Color(0xFF0000FF),
                child: const Text('Show Weather',style: TextStyle(fontSize:21,color: Colors.white)),
                onPressed: (){
                  showWeather();
                },

              ),
              const SizedBox(height: 50),
              Text('Its $degree degree Celsius.', style: const TextStyle(fontSize: 21, fontWeight:FontWeight.bold)),
              const SizedBox(height: 50),
              const Text('Developed by: UsraYousaf',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold))


            ],
          ),
        ),
      ),
    ));
  }
}
