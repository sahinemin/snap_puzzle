import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_fonts/google_fonts.dart';

class Scoreboard extends StatefulWidget {
  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  List<dynamic> topThreeUsers;

  CollectionReference topThree = FirebaseFirestore.instance.collection('Users');

  Future<String> getTopThree(userIndex) async {
    var resultThree =
        await topThree.orderBy('score', descending: true).limit(3).get();
    List<dynamic> temp = [];
    resultThree.docs.forEach((doc) {
      temp.add(doc['name']);
    });
    topThreeUsers = temp;
    return topThreeUsers[userIndex];
  }

  @override
  void initState() {
    super.initState();
  }

  List<Map> userRank;

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Users')
      .orderBy('score')
      .limit(20)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
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
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FutureBuilder(
                                          future: getTopThree(2),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                snapshot.data,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                  decoration:
                                                      TextDecoration.none,
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .textScaleFactor *
                                                          12,
                                                ),
                                              );
                                            } else {
                                              return Text('Loading...');
                                            }
                                          },
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: FutureBuilder(
                                            future: getTopThree(0),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(
                                                  snapshot.data,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.roboto(
                                                    decoration:
                                                        TextDecoration.none,
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    fontSize: MediaQuery.of(
                                                                context)
                                                            .textScaleFactor *
                                                        12,
                                                  ),
                                                );
                                              } else {
                                                return Text('Loading...');
                                              }
                                            },
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          child: FutureBuilder(
                                            future: getTopThree(1),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(
                                                  snapshot.data,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.roboto(
                                                    decoration:
                                                        TextDecoration.none,
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    fontSize: MediaQuery.of(
                                                                context)
                                                            .textScaleFactor *
                                                        12,
                                                  ),
                                                );
                                              } else {
                                                return Text('Loading...');
                                              }
                                            },
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
                Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      border: Border.all(
                          width: 5.0, color: Colors.greenAccent[400]),
                    ),
                    child: StreamBuilder(
                      stream: _usersStream,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            List rev = snapshot.data.docs.toList();

                            return Column(
                              children: [
                                new ListTile(
                                  tileColor: index == snapshot.data.docs.length
                                      ? Colors.yellow
                                      : Colors.white,
                                  title: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            '#${snapshot.data.docs.length - (index)}',
                                            style: TextStyle(fontSize: 18),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Flexible(
                                          child: new Text(
                                            '${rev[index]['name']}',
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: index ==
                                                        snapshot
                                                            .data.docs.length
                                                    ? Colors.yellow
                                                    : Colors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                            ' ${rev[index]['score'].toString()} pts',
                                            style: TextStyle(fontSize: 20),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                        );
                      },
                    )),
              ],
            )),
      ),
    );
  }
}
