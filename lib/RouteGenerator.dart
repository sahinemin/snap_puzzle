import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/LogIn':
        return MaterialPageRoute(builder: (_) => LogIn());
    }
  }
}