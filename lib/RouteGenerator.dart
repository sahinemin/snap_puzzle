import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_puzzle/GoogleRegister.dart';
import 'package:snap_puzzle/Scoreboard.dart';
import 'package:snap_puzzle/SignUp.dart';
import 'package:snap_puzzle/classroom.dart';
import 'LogIn.dart';
import 'contacts.dart';
import 'chat.dart';
import 'package:snap_puzzle/Administration.dart';
import 'settings.dart';
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
      case '/ChatClass':
        return MaterialPageRoute(builder: (context) => chat(chatName: classname, isClass: true, adminPrivileges: false,));
      case '/TChatClass':
        return MaterialPageRoute(builder: (context) => chat(chatName: classname, isClass: true, adminPrivileges: true,));
      case '/Scoreboard':
        return MaterialPageRoute(builder: (_) => Scoreboard());
      case '/Administration':
        return MaterialPageRoute(builder: (_) => administration(classname));
      case '/GoogleRegister':
        return MaterialPageRoute(builder: (_) => Register());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
  }
}