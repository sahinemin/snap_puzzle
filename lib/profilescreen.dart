import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            child: Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              body: SafeArea(
                  child: Container(
                    color: Color(0xFF003942),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(profilescreen.photo),
                                        fit: BoxFit.fitHeight)),
                                height: 200,
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            )));
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
