import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class Scoreboard extends StatelessWidget {
  final List<String> entries = <String>['1', '2', '3','4', '5', '6','7', '8', '9','10', '11', '12','13', '14', '15','16', '17', '18'];
  final List<int> colorCodes = <int>[600, 500,600, 500,600, 500,600, 500,600, 500,600, 500,600, 500,600, 500,600,500];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xFF003942),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Scoreboard'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 150,
                    child: Icon(Icons.emoji_events,
                        color: Color(0xFFE19600), size: 100)),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(75,0,75,25),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber[colorCodes[index]],
                          child: Center(child: Text('Student ${entries[index]} - ${(18-index)*125} pts')),
                        );
                      }),
                )
              ],
            )));
  }
}
