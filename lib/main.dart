import 'package:flutter/material.dart';
import 'RouteGenerator.dart';

import 'package:firebase_core/firebase_core.dart';
Future  main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:'/LogIn',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}




