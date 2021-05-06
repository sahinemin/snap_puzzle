import 'package:flutter/material.dart';
import 'RouteGenerator.dart';

void main()  {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SnapPuzzle',
    initialRoute:'/LogIn',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}




