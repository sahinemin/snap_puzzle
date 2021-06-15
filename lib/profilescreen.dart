import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snap_puzzle/LogIn.dart';
import 'package:snap_puzzle/GoogleRegister.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  CollectionReference getUserData = FirebaseFirestore.instance.collection('Users');
  
  Future<int> getUserScore() async {
    var based = await getUserData.where('name', isEqualTo: profilescreen.fullname).get();
    print('reached here');
    List<dynamic> temp = [];
    based.docs.forEach((doc) {
      temp.add(doc['score']);
    });
    
    int userScore = int.parse(temp[0]);
    return userScore;
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserScore();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
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
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${profilescreen.fullname}',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${profilescreen.fullname}"',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[500]),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 150.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: new Center(
                          child: FutureBuilder(
                                        future: getUserScore(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              '${snapshot.data} pts',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                decoration: TextDecoration.none,
                                                textStyle: TextStyle(
                                                  color: Colors.redAccent[400],
                                                ),
                                                fontSize: MediaQuery.of(context)
                                                        .textScaleFactor *
                                                    14,
                                                    fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          } else {
                                            return Text('Loading...');
                                          }
                                        },
                                      ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.34,
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
                  color: Colors.green,
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
              ]),
            ),
          ),
        ));
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
                  elevation: 0.0,
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
                        fontSize: MediaQuery.of(context).textScaleFactor * 17,
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
                      '***************',
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
                      'Rank',
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
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 17,
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
class BadgeContainer extends StatefulWidget {
  String userFullName;

  BadgeContainer({Key key, this.userFullName}) : super(key: key);

  @override
  State<BadgeContainer> createState() => _BadgeContainerState();
}

class _BadgeContainerState extends State<BadgeContainer> {
  int score = 1700;

  CollectionReference getUserData = FirebaseFirestore.instance.collection('Users');

  Future<int> getUserScore() async {
    var based = await getUserData.where('name', isEqualTo: profilescreen.fullname).get();
    List<dynamic> temp = [];
    based.docs.forEach((doc) {
      temp.add(doc['score']);
    });
    int userScore = int.parse(temp[0]);
    return userScore;
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: getUserScore(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: score < 200
                          ? Container()
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                              decoration: new BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/badge_wood.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: snapshot.data < 200
                          ? Container()
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                              decoration: new BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/badge_bronze.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: snapshot.data < 500
                          ? Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                              decoration: new BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/badge_silver.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: snapshot.data < 700
                          ? Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                              decoration: new BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/badge_gold.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: snapshot.data < 1200
                          ? Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.11,
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.19,
                              height: MediaQuery.of(context).size.height * 0.12,
                              decoration: new BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/badge_platinum.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.11,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
                        } else {
                          return Text('Loading...');
                        }}
        
    );
  }
}
