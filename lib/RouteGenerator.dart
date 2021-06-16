import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_puzzle/GoogleRegister.dart';
import 'package:snap_puzzle/Scoreboard.dart';
import 'package:snap_puzzle/SendPuzzle.dart';
import 'package:snap_puzzle/SignUp.dart';
import 'package:snap_puzzle/addfriend.dart';
import 'package:snap_puzzle/classroom.dart';
import 'LogIn.dart';
import 'class.dart';
import 'contacts.dart';
import 'chat.dart';
import 'package:snap_puzzle/Administration.dart';
import 'createPhotoQuiz.dart';
import 'createPuzzle.dart';
import 'createTextQuiz.dart';
import 'settings.dart';
import 'friends.dart';
import 'solvePhotoQuiz.dart';
import 'solveTextQuiz.dart';
import 'package:snap_puzzle/deneme.dart';

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
        return MaterialPageRoute(builder: (context) => chat(chatName: passedChatName,friendid: passedid,)); //this code needs to be change for implementation
      case '/Class':
        return MaterialPageRoute(builder: (context) => classroom(chatName: passedClassName)); //this code needs to be change for implementation
      case '/Scoreboard':
        return MaterialPageRoute(builder: (_) => Scoreboard());
      case '/Administration':
        return MaterialPageRoute(builder: (_) => administration(classname));
      case '/GoogleRegister':
        return MaterialPageRoute(builder: (_) => Register());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/CreatePuzzle' :
        return MaterialPageRoute(builder: (_) => CreatePuzzle());
      case '/SendPuzzle' :
        return MaterialPageRoute(builder: (_) => SendPuzzle());
      case '/CreateTextQuiz' :
        return MaterialPageRoute(builder: (_) => CreateTextQuiz());
      case '/CreatePhotoQuiz' :
        return MaterialPageRoute(builder: (_) => CreatePhotoQuiz());
      case '/Friends' :
        return MaterialPageRoute(builder: (_) => Friends());
      case '/addfriend' :
        return MaterialPageRoute(builder: (_) => addfriend());
      case '/SolvePhotoQuiz' :
        return MaterialPageRoute(builder: (_) => SolvePhotoQuiz());
      case '/SolveTextQuiz' :
        return MaterialPageRoute(builder: (_) => SolveTextQuiz());

    }
  }
}