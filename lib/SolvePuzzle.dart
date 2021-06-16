import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat.dart';
import 'profilescreen.dart';

final TextEditingController _answerController = new TextEditingController();
var phuri;
var phans;
class SolvePuzzle extends StatefulWidget {
  @override
  final String index;
  SolvePuzzle(this.index) : super();
  _SolvePuzzleState createState() => _SolvePuzzleState();
}

class _SolvePuzzleState extends State<SolvePuzzle> {
  @override
  @override
  Widget build(BuildContext context) {
    //print(cat+"xxx");
    //print(ty+"xxx");
    //print(dif+"xxx");
    //print(widget.index);
    return WillPopScope(
      onWillPop: () {
        _answerController.clear();
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.greenAccent[400],
            title: Text('Quiz'),
          ),
          body: StreamBuilder(
              stream: cat!="PuzzleQuiz"?FirebaseFirestore.instance
                  .collection('Puzzles')
                  .doc(cat)
                  .collection(ty).doc(dif).
              collection('Results')
                  .snapshots():
              FirebaseFirestore.instance
                  .collection('Puzzles')
                  .doc(dif).collection(dif).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text('Loading:');
                }
                //print(user.uid + "-" + passedid.toString().trim());
                //return ListView.separated(
                //children: snapshot.data.docs.map((doc) => ListTile(title: Text(doc['receiverid']),subtitle: Text('Emin'),)).toList(),
                //);
                print(cat);
                print(ty);
                print(dif);

                int temp=snapshot.data.docs.length;
                print(temp);
                for(int i=0; i<temp;i++) {
                  if (snapshot.data.docs.elementAt(i).id == docn) {
                    phans = snapshot.data.docs.elementAt(i).get('answer');
                    phuri = snapshot.data.docs.elementAt(i).get('url');
                    print(phans+"dsasd");
                    print(phuri+"sadads");
                  }
                }

                //phans = snapshot.data.docs.elementAt(0).get('answer');
                //phuri = snapshot.data.docs.elementAt(0).get('url');

                    //print(snapshot.data.docs.elementAt(0).get('answer'));
                    //print(snapshot.data.docs.elementAt(0).get('url'));
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.white,
                    ),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'Solve This Quiz to See \n        the Message!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 300,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: new BoxDecoration(
                                    color: Colors.green.shade400,
                                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: NetworkImage(phuri),
                                        fit: BoxFit.cover,
                                      )
                                  ),

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: new BoxDecoration(
                                    color: Colors.green.shade400,
                                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: TextFormField(
                                    maxLength: 50,
                                    maxLines: 1,
                                    controller: _answerController,
                                    validator: (String val) {
                                      if (val.isEmpty) {
                                        return "Answer is empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintStyle:
                                      TextStyle(color: Colors.white60, fontSize: 15),
                                      hintText: 'Answer',
                                      border: InputBorder.none,
                                      counterText: "",
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: MaterialButton(
                                      color: Colors.redAccent[400],
                                      child: Text('submit',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      height: 40,
                                      minWidth: 120,
                                      onPressed: () async{
                                        if (!_answerController.text.isEmpty) {
                                          //print("x");
                                          if(phans==_answerController.text.toString().trim()){
                                            profilescreen.userscore+=5;
                                            print(k);
                                            print(widget.index.toString());
                                            FirebaseFirestore.instance.collection('Chat').doc(k).collection("Messages").doc(widget.index.toString()).set(
                                                {'isencrypted':false},SetOptions(merge: true) );

                                            return Navigator.pop(context);


                                          }
                                        }
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      //child: Text('ENCRYPTED'),alignment:Alignment.bottomLeft//return Container(child: Text('ENCRYPTED'),alignment:Alignment.bottomRight );
                    }
                );
              })
      ),
    );
  }
}
Future updateUserData() async {
  final DocumentReference userCollection =
  FirebaseFirestore.instance.collection('Users').doc(user.uid);
  await userCollection.set({'score':profilescreen.userscore},SetOptions(merge: true));

}