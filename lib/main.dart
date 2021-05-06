import 'package:flutter/material.dart';
import 'RouteGenerator.dart';

import 'package:firebase_core/firebase_core.dart';
Future  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SnapPuzzle',
    initialRoute:'/LogIn',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}




