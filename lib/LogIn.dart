import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snap_puzzle/SignUp.dart';
import 'package:snap_puzzle/profilescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

User user;
bool isAdmin = false;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

//Logini yapıyoruz
class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkValue = false;
  Future _login() async {
    try {
      user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      print(user.uid.toString());
      ProfileScreen.photo = 'https://via.placeholder.com/150';
      print(ProfileScreen.photo);
      //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Logged in successfully.")));
      Navigator.of(context).pushNamed('/MainPage');
    } catch (e) {
      print("ERRRRORRRRRRRRRR = $e");
    }
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .snapshots()
        .listen((event) {
      ProfileScreen.fullname = event['name'];
      ProfileScreen.school = event['school'];
      ProfileScreen.userscore = event['score'];
      isAdmin = event['isAdmin'];
    });
    /*
    FirebaseFirestore.instance.collection('Users').snapshots().listen((data)=> data.docs.forEach((doc){
      profilescreen.fullname=doc['name'];
      profilescreen.school=doc['school'];}));
*/
  }

  Future _googlelogin() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      bool a = false;
      user = (await _auth.signInWithCredential(credential)).user;
      ProfileScreen.fullname = user.displayName.toString();
      ProfileScreen.photo = user.photoURL.toString();
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('Users');
      collectionReference.get().then((value) => {
            for (int i = 0; i < value.docs.length; i++)
              {if (user.uid == value.docs[i].id) a = true},
            if (a)
              {
                collectionReference.doc(user.uid).snapshots().listen((event) {
                  ProfileScreen.fullname = event['name'];
                  ProfileScreen.school = event['school'];
                  ProfileScreen.userscore = event['score'];
                  isAdmin = event['isAdmin'];
                }),
                Navigator.of(context).pushNamed('/MainPage'),
              }
            else
              {
                Navigator.of(context).pushNamed('/GoogleRegister'),
              }
          });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Container(
          alignment: Alignment.center,
          color: Colors.greenAccent[700],
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    'SnapPuzzle',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          margin: EdgeInsets.only(top: 20),
                          decoration: new BoxDecoration(
                            color: Color(0x60FFFFFF),
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Please enter a mail";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60, fontSize: 15),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          margin: EdgeInsets.only(top: 20),
                          decoration: new BoxDecoration(
                            color: Color(0x60FFFFFF),
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Please enter a password";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60, fontSize: 15),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              onChanged: (bool value) {
                                setState(() {
                                  checkValue = value;
                                });
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          decoration: new BoxDecoration(
                            color: Colors.redAccent[400],
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          // ignore: deprecated_member_use
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                await _login();
                                await DatabaseService().addUserData();
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 15),
                          decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          // ignore: deprecated_member_use
                          child: ElevatedButton(
                            child: Image(
                              image: AssetImage('assets/sign_in_google.png'),
                            ),
                            onPressed: () async {
                              await _googlelogin();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 20,
                  color: Colors.white24,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't you have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/SignUp');
                          },
                          child: Text(
                            'Sign up!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
