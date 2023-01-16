import 'dart:async';
import 'package:flutter/material.dart';

import '../ui/auth/login_screen.dart';


class SplashServices{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
}