import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_puzzle/LogIn.dart';
import 'package:snap_puzzle/profilescreen.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _schoolController = TextEditingController();

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xFF003942),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Register with Google'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Container(
                    child: Text(
                      'Please fill the missing information to \ncomplete your registration',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
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
                      /* validator: (String val){
                        if(val.isEmpty){
                          return "Please enter a name";
                        }
                        return null;
                      },*/
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
                      controller: _schoolController,
                      /*  validator: (String val){
                        if(val.isEmpty){
                          return "Please enter an school";
                        }
                        return null;
                      },*/
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: "School",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    )),
                MaterialButton(
                  color: Color(0xFFE19600),
                  height: 50,
                  minWidth: 150,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async //async
                      {
                    await DatabaseService().addUserData();
                    ProfileScreen.fullname = _nameController.text;
                    ProfileScreen.school = _schoolController.text;
                    Navigator.of(context).pushNamed('/MainPage');
                    //    _Register();
                  },
                )
              ],
            )));
  }
}

class DatabaseService {
  //DatabaseService(this.uid);
  final DocumentReference userCollection =
      FirebaseFirestore.instance.collection('Users').doc(user.uid);
  Future addUserData() async {
    print(user.metadata.toString());
    if (_nameController.text != null && _schoolController.text != null)
      await userCollection.set({
        'name': _nameController.text,
        'school': _schoolController.text,
        'score': 0,
        'isAdmin': false
      });
  }
}
