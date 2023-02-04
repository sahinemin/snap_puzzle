import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_puzzle/LogIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _schoolController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey2,
      backgroundColor: Colors.greenAccent[700],
      appBar: AppBar(
        title: Text(
          'Sign Up to Snap Puzzle',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.greenAccent[700],
      ),
      body: Container(
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: new BoxDecoration(
                    color: Color(0x60FFFFFF),
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Please enter a name";
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  )),
              Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  margin: EdgeInsets.all(20),
                  decoration: new BoxDecoration(
                    color: Color(0x60FFFFFF),
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Please enter an e-mail";
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  )),
              Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: new BoxDecoration(
                    color: Color(0x60FFFFFF),
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: " Password ",
                        hintStyle: TextStyle(color: Colors.white)),
                  )),
              Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  margin: EdgeInsets.all(20),
                  decoration: new BoxDecoration(
                    color: Color(0x60FFFFFF),
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    controller: _schoolController,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Please enter an e-mail";
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: "School",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  )),
              Container(
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(140, 20, 140, 0),
                decoration: new BoxDecoration(
                  color: Colors.redAccent[400],
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                ),
                child: TextButton(
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    _register();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim()))
          .user;
      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
        // ignore: deprecated_member_use
        await user.updateProfile(displayName: _nameController.text);
        _auth.currentUser;
        Navigator.of(context).pushNamed('/LogIn').then((value) {
          setState(() {});
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class DatabaseService {
  //DatabaseService(this.uid);
  final DocumentReference userCollection =
      FirebaseFirestore.instance.collection('Users').doc(user.uid);
  Future addUserData() async {
    if (_nameController.text != null && _schoolController.text.isNotEmpty) {
      print(user.metadata.toString());
      await userCollection.set({
        'name': _nameController.text,
        'school': _schoolController.text,
        'score': 0.toString(),
        'isAdmin': false,
      });
    }
  }
}
