import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_puzzle/GoogleRegister.dart';
import 'package:snap_puzzle/Scoreboard.dart';
import 'package:snap_puzzle/SendPuzzle.dart';
import 'package:snap_puzzle/SignUp.dart';
import 'package:snap_puzzle/SolvePuzzle.dart';
import 'package:snap_puzzle/addfriend.dart';
import 'package:snap_puzzle/generatePuzzle.dart';
import 'LogIn.dart';
import 'contacts.dart';
import 'chat.dart';
import 'createPhotoQuiz.dart';
import 'createPuzzle.dart';
import 'createTextQuiz.dart';
import 'settings.dart';
import 'friends.dart';
import 'solveTextQuiz.dart';
import 'accountDetails.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/LogIn':
        return MaterialPageRoute(builder: (_) => LogIn());
      case '/AccountDetails':
        return MaterialPageRoute(builder: (_) => AccountDetails());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/MainPage':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/Chat':
        return MaterialPageRoute(
            builder: (context) =>
                chat(chatName: passedChatName, friendid: passedid));
      case '/Scoreboard':
        return MaterialPageRoute(builder: (_) => Scoreboard());
      case '/GoogleRegister':
        return MaterialPageRoute(builder: (_) => Register());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/CreatePuzzle':
        return MaterialPageRoute(builder: (_) => CreatePuzzle());
      case '/SendPuzzle':
        return MaterialPageRoute(builder: (_) => SendPuzzle());
      case '/CreateTextQuiz':
        return MaterialPageRoute(builder: (_) => CreateTextQuiz());
      case '/CreatePhotoQuiz':
        return MaterialPageRoute(builder: (_) => CreatePhotoQuiz());
      case '/Friends':
        return MaterialPageRoute(builder: (_) => Friends());
      case '/addfriend':
        return MaterialPageRoute(builder: (_) => addfriend());
      case '/SolvePuzzle':
        return MaterialPageRoute(builder: (_) => SolvePuzzle(qqq));
      case '/generatePuzzle':
        return MaterialPageRoute(builder: (_) => new GeneratePuzzle(imageUrl : phuri));
    //   case '/SolvePhotoQuiz':
    //     return MaterialPageRoute(            builder: (_) => SolvePhotoQuiz(
    //             answer: passedAnswer,
    //             maxPoints: passedMaxPoints,
    //             url: passedURL));
    //   case '/SolveTextQuiz':
    //     return MaterialPageRoute(
    //         builder: (_) => SolveTextQuiz(
    //             correctAnswer: passedAnswer,
    //             maxPoints: passedMaxPoints,
    //             desc: passedDesc,
    //             sel1: passedSel1,
    //             sel2: passedSel2,
    //             sel3: passedSel3,
    //             sel4: passedSel4));
    //   case '/SolvePuzzle':
    //     return MaterialPageRoute(
    //         builder: (_) => GeneratePuzzle(
    //             maxPoints: passedMaxPoints,
    //             url: passedURL,
    //           difficulty: passedDifficulty,
    //         ));
    //
    }
  }
}