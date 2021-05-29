import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snap_puzzle/LogIn.dart';
import 'package:snap_puzzle/GoogleRegister.dart';

void main() {
  runApp(profilescreen());
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class profilescreen extends StatefulWidget {
  static String fullname;
  static String photo;
  static String school;

  const profilescreen({Key key}) : super(key: key);

  @override
  _profilescreenState createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green.shade700,
              child: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed('/Settings');
              }),
          body: SafeArea(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                    width: double.infinity,
                    height: 110,
                    child: Container(
                      alignment: Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundImage: NetworkImage(profilescreen.photo),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 500,
                                  //color: Colors.lightBlue,
                                  color: Colors.orange[300],
                                  child: Text(
                                      "Fullname: ${profilescreen.fullname}")),
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 500,
                                  color: Colors.orange,
                                  //color: Colors.lightBlue,
                                  child: Text(
                                      "Schoolname: ${profilescreen.school}")),
                  Container(padding: const EdgeInsets.all(8),
                      width: 500,
                      color: Colors.orange,
                      //color: Colors.lightBlue,
                      child: Text(
                          "Score"))
                  ,


                  Container(
                                height: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(150, 20, 150, 0),
                                decoration: new BoxDecoration(
                                  color: Color(0xFFE19600),
                                  borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                ),
                                child: MaterialButton(
                                  color: Color(0xFFE19600),
                                  child: Text(
                                    'LOG OUT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await googlelogout();
                                    Navigator.of(context).pushNamed('/LogIn');
                                  },
                                ),
                              )
                            ],
                          ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(
                                  child: Icon(Icons.settings),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/Settings');
                                  }),
                            ],
                          )
                        ],
                      ),
                      child: new Center(
                        child: new Text(
                          "1000 pts",
                          style: TextStyle(
                              color: Colors.redAccent[400],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.40,
                  enableInfiniteScroll: false,
                ),
                items: ['Badges', 'Statistics', 'Info'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      switch (i) {
                        case 'Badges':
                          {
                            return BadgeContainer();
                          }
                        case 'Statistics':
                          {
                            return StatisticsContainer();
                          }
                        default:
                          {
                            return UserInfoContainer();
                          }
                      }
                    },
                  );
                }).toList(),
              ),
              FlatButton(
                child: Text(
                  'LOG OUT',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                onPressed: () async {
                  await googlelogout();
                  Navigator.of(context).pushNamed('/LogIn');
                },
              ),
            ]
                ),
          ),
        ),
      ),
    );
  }

  Future googlelogout() async {
    try {
      await _auth.signOut();
      //await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      print(_googleSignIn.currentUser.id);

    } catch (e) {
      print(e.toString());
    }
  }
}

class UserInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardSize = 47.0;
    var iconSize = 23.0;
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(
                  'User Information',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700),
                ),
                Expanded(child: Divider()),
              ]),
            ),
            Center(
              child: Container(
                height: cardSize,
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.person_outlined,
                      color: Colors.black,
                      size: iconSize,
                    ),
                    title: Text(
                      '${profilescreen.fullname}"',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(),
                        fontSize: MediaQuery.of(context).textScaleFactor * 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: cardSize,
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.green,
                      size: iconSize,
                    ),
                    title: Text(
                      '${profilescreen.school}',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(),
                        fontSize: MediaQuery.of(context).textScaleFactor * 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: cardSize,
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.place_outlined,
                      color: Colors.red,
                      size: iconSize,
                    ),
                    title: Text(
                      'Kayseri, Turkey',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(),
                        fontSize: MediaQuery.of(context).textScaleFactor * 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: cardSize,
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                      size: iconSize,
                    ),
                    title: Text(
                      'Username45@gmail.com',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(),
                        fontSize: MediaQuery.of(context).textScaleFactor * 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

//Carousel for statistics
class StatisticsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Color(0xff),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(
                  'Statistics',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700),
                ),
                Expanded(child: Divider()),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: const Color(0xff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            'Favourite Category: ',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 12,
                            ),
                          ),
                        ),
                        Text(
                          'Math',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.green[900],
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: const Color(0xff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Amount Solved',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: MediaQuery.textScaleFactorOf(context) * 17,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '54',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.green[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: const Color(0xff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Percentage of Correct Question: ',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '60%',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.green[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: const Color(0xff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Dominating Against: ',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          12),
                            ),
                          ),
                        ),
                        Text(
                          'User54',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.green[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

//Carousel for Badge
class BadgeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(
                  'Badges',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700),
                ),
                Expanded(child: Divider()),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.red,
                    child: Center(child: Text('Badge 1')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.red,
                    child: Center(child: Text('Badge 1')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.red,
                    child: Center(child: Text('Badge 1')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.red,
                    child: Center(child: Text('Badge 1')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.red,
                    child: Center(child: Text('Badge 1')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.red,
                    child: Center(child: Text('Badge 1')),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
