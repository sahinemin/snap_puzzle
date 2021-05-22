import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
<<<<<<< Updated upstream
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();
=======

>>>>>>> Stashed changes
void main() {
  runApp(profilescreen());
}
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();
class profilescreen extends StatefulWidget {
  const profilescreen({Key key}) : super(key: key);

  @override
  _profilescreenState createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                                    image: DecorationImage(image: NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GizcmzP7CO5wct3xq6ZBTj-SYgPsvjyoQemuIEDbA=s96-c'),fit: BoxFit.fitHeight)
                                  ),
                                  height:200,
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
                                          //color: Colors.lightBlue,
                                          color: Colors.orange,
                                          width: 500,
                                          child: Text(
                                              "id: 1"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange[300],
                                          child: Text(
                                              "username: Hikmet42"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange,
                                          child: Text(
                                              "name: Hikmet Can"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange[300],
                                          child: Text(
                                              "surname: Doğancı"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          color: Colors.orange,
                                          //color: Colors.lightBlue,
                                          child: Text(
                                              "School name: Agü"
                                          )
                                      ),
                                      Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(150, 20, 150, 0),
                                        decoration: new BoxDecoration(
                                          color: Color(0xFFE19600),
                                          borderRadius: new BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: FlatButton(
                                          child: Text('LOG OUT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: ()async {
<<<<<<< Updated upstream
                                            await googlelogout();
=======
                                            await _googlelogout();
>>>>>>> Stashed changes
                                            Navigator.of(context).pushNamed('/LogIn');
                                          },
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FloatingActionButton(child: Icon(Icons.settings)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

              ),
            )
        )
    );
  }
<<<<<<< Updated upstream
  Future googlelogout()async{
=======
  Future _googlelogout()async{
>>>>>>> Stashed changes
    try{
      await _auth.signOut();
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    }
<<<<<<< Updated upstream
   catch(e){
      print(e.toString());
   }
=======
    catch(e){
      print (e.toString());
    }
>>>>>>> Stashed changes

  }
}


