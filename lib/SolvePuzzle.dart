import 'package:flutter/material.dart';
import 'package:snap_puzzle/generatePuzzle.dart';
import 'LogIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chat.dart';
import 'profilescreen.dart';
var dex;

final TextEditingController _answerController = new TextEditingController();
var phuri;
var phans;
bool textquiz;
var _answer;
//var answer;
var desc;
var sel1;
var sel2;
var sel3;
var sel4;
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
    Stream<QuerySnapshot<Map<String, dynamic>>> yayin;

    if(ty!="PuzzleQuiz"){
      //print(cat);
     // print(ty);
      //print(dif);
      yayin=FirebaseFirestore.instance
          .collection('Puzzles')
          .doc(cat)
          .collection(ty).doc(dif).
      collection('Results')
          .snapshots();
    }
    else if(ty=="PuzzleQuiz"){
      if (dif == 'Easy')
        dif = 2;
      else if (dif == 'Normal')
        dif = 3;
      else
        dif = 4;
      print(dif.toString()+"aaaaa");
      yayin=FirebaseFirestore.instance
          .collection('Puzzles')
          .doc('photo')
          .collection(dif.toString()).snapshots();
    }
    //print(cat+"xxx");
    //print(ty+"xxx");
    //print(dif+"xxx");
    //print(widget.index);
    return WillPopScope(
      onWillPop: () {
        _answerController.clear();
        _answer = null;
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.greenAccent[400],
            title: Text('Quiz'),
          ),
          body: StreamBuilder(
              stream: yayin/*cat!="PuzzleQuiz"?FirebaseFirestore.instance
                  .collection('Puzzles')
                  .doc(cat)
                  .collection(ty).doc(dif).
              collection('Results')
                  .snapshots():
              FirebaseFirestore.instance
                  .collection('Puzzles')
                  .doc(dif).collection(dif).snapshots(),*/
              ,builder: (BuildContext context,
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
                //print(cat);
                //print(ty);
                //print(dif);

                int temp=snapshot.data.docs.length;
                String sacma;
                for(int i=0; i<temp;i++) {
                  sacma=snapshot.data.docs.elementAt(i).id;
                  print(sacma);
                  //print(docn);
                  if (sacma == docn) {
                    if(ty=="PhotoQuiz"){
                      phans = snapshot.data.docs.elementAt(i).get('answer');
                      phuri = snapshot.data.docs.elementAt(i).get('url');
                    }
                    else if(ty=="TextQuiz"){
                      phans = snapshot.data.docs.elementAt(i).get('answer');
                      desc=snapshot.data.docs.elementAt(i).get('desc');
                      sel1=snapshot.data.docs.elementAt(i).get('sel1');
                      sel2=snapshot.data.docs.elementAt(i).get('sel2');
                      sel3=snapshot.data.docs.elementAt(i).get('sel3');
                      sel4=snapshot.data.docs.elementAt(i).get('sel4');
                    }
                    else if(ty=="PuzzleQuiz"){
                      phuri = snapshot.data.docs.elementAt(i).get('url');
                    }
                    //print(phans+"dsasd");
                    //print(phuri+"sadads");
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
                      if(ty=="TextQuiz"){
                        return Padding(
                          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Solve This Quiz to See the \n                Message',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    margin: EdgeInsets.only(top: 20),
                                    decoration: new BoxDecoration(
                                      color: Colors.green.shade400,
                                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                      child: Text(desc),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.redAccent[400]),
                                      value: 1,
                                      groupValue: _answer,
                                      onChanged: (value) {
                                        setState(() {
                                          _answer = value;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          decoration: new BoxDecoration(
                                            color: Colors.green.shade400,
                                            borderRadius:
                                            new BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                            child: Text(sel1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.redAccent[400]),
                                      value: 2,
                                      groupValue: _answer,
                                      onChanged: (value) {
                                        setState(() {
                                          _answer = value;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          decoration: new BoxDecoration(
                                            color: Colors.green.shade400,
                                            borderRadius:
                                            new BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                            child: Text(sel2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.redAccent[400]),
                                      value: 3,
                                      groupValue: _answer,
                                      onChanged: (value) {
                                        setState(() {
                                          _answer = value;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          decoration: new BoxDecoration(
                                            color: Colors.green.shade400,
                                            borderRadius:
                                            new BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                            child: Text(sel3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.redAccent[400]),
                                      value: 4,
                                      groupValue: _answer,
                                      onChanged: (value) {
                                        setState(() {
                                          _answer = value;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          decoration: new BoxDecoration(
                                            color: Colors.green.shade400,
                                            borderRadius:
                                            new BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                            child: Text(sel4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MaterialButton(
                                        color: Colors.redAccent[400],
                                        child: Text(
                                          'submit',
                                          style: TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                        height: 40,
                                        minWidth: 120,
                                        onPressed: ()async {
                                          if (_answer != null) {
                                            //print(phans);
                                            if(_answer.toString()==phans){
                                              _answerController.clear();
                                              _answer = null;
                                              profilescreen.userscore+=5;
                                              await updateUserData();
                                              //print(profilescreen.userscore);
                                              //print(k);
                                              //print(widget.index.toString());
                                              FirebaseFirestore.instance.collection('Chat').doc(k).collection("Messages").doc(widget.index.toString()).set(
                                                  {'isencrypted':false},SetOptions(merge: true) );
                                              Navigator.pop(context);
                                            }
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      else if(ty=="PhotoQuiz"){
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
                                          //print(_answer.toString());
                                          //print(phans);
                                          if (_answerController.text!=null) {
                                            //print("x");
                                            if(phans==_answerController.text){
                                              _answerController.clear();
                                              _answer = null;
                                              profilescreen.userscore+=5;
                                              await updateUserData();
                                              //print(profilescreen.userscore);
                                              //print(k);
                                              //print(widget.index.toString());
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
                      }
                      else{
                        return(IconButton(icon:Icon(Icons.clear),onPressed: (){
                          dex=widget.index;
                          Navigator.of(context).pushNamed(('/generatePuzzle'));
                        },));

                      }
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