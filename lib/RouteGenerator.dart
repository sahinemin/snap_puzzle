import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_puzzle/SignUp.dart';
import 'LogIn.dart';
import 'main.dart';
import 'contacts.dart';
import 'chat.dart';
class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/LogIn':
        return MaterialPageRoute(builder: (_) => LogIn());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/MainPage':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/Chat':
        return MaterialPageRoute(builder: (context) => chat(chatName: passedindex, isClass: false, adminPrivileges: false,));
    }
  }
}