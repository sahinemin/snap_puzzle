import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class Scoreboard extends StatelessWidget {
  final List<String> entries = <String>['1', '2', '3','4', '5', '6','7', '8', '9','10', '11', '12','13', '14', '15','16', '17', '18'];
  final List<int> colorCodes = <int>[600, 500,600, 500,600, 500,600, 500,600, 500,600, 500,600, 500,600, 500,600,500];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 1.0),
                        child: Text(
                          'World Rank',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            fontSize: MediaQuery.of(context).textScaleFactor * 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        child: Container(
                          width: 280,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Icon(
                                      Icons.emoji_events,
                                      color: Colors.brown[600],
                                      size: 55,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.redAccent[400],
                                    width: 280 / 3,
                                    height: 240 * (1 / 4),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Student ${entries[2]}',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                                10,
                                          ),
                                        ),
                                        Text(
                                          '#3',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                                17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Icon(
                                      Icons.emoji_events,
                                      color: Colors.yellow[600],
                                      size: 55,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.deepPurple[900],
                                    width: 280 / 3,
                                    height: 150 * (3 / 4),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            'Student ${entries[0]}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              decoration: TextDecoration.none,
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                                  13,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '#1',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                                17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Icon(
                                      Icons.emoji_events,
                                      color: Colors.grey[400],
                                      size: 55,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.greenAccent[400],
                                    width: 280 / 3,
                                    height: 190 * (2 / 4),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          child: Text(
                                            'Student ${entries[1]}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              decoration: TextDecoration.none,
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                                  12,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '#2',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            decoration: TextDecoration.none,
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                                17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Text(
                  'Top 20',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    fontSize: MediaQuery.of(context).textScaleFactor * 20,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9.0),),
                        border: Border.all(width: 5.0, color: Colors.greenAccent[400]),
                      ),
                      child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(45, 0, 45, 25),
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 40,
                              child: Center(
                                  child: Text(
                                      '#${index + 1} Student ${entries[index]} - ${(18 - index) * 125} pts',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        decoration: TextDecoration
                                            .none, //fix to underline that appears
                                      ))),
                            );
                          }),
                    ),
                  ),
                ),

              ],
            )),
        );
  }
}
