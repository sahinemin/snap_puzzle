import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snap_puzzle/contacts.dart';
import 'LogIn.dart';
import 'deneme.dart';

var ids = [];
int sayac = 0;
String check;
int a;
bool isphoto = false;
String docname;
var cat;
var gelenresimurl;
var type;
var ty;
var category;
var difficulty;
var dif;
var docn;
var qqq;
int maxPoints;

TextEditingController message = new TextEditingController();
bool isSwitcheden = false;
String k;
File _file;

// ignore: must_be_immutable
class Chat extends StatelessWidget {
  Chat({this.chatName, this.friendid}) : super();

  String chatName;
  String friendid;

  @override
  Widget build(BuildContext context) {
    //print(passedid);
    return Scaffold(body: DirectContact(chatName, friendid)
        // home: DirectContact(contactName: "Contact Name"),
        );
  }
}

class DirectContact extends StatefulWidget {
  DirectContact(this.contactName, String friendid) : super();
  final String contactName;

  @override
  _DirectContactState createState() => _DirectContactState();
}

class _DirectContactState extends State<DirectContact> {
  Future getImage(ImageSource source) async {
    // ignore: deprecated_member_use
    var image = await ImagePicker().getImage(source: source);
    if (image != null) {
      setState(() {
        _file = File(image.path);
        //print(image.path + "mii");
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Switch(
            value: isSwitcheden,
            onChanged: (value) {
              setState(() {
                isSwitcheden = value;
              });
            },
            activeTrackColor: Colors.redAccent[400],
            activeColor: Colors.white,
          )
        ],
        backgroundColor: Colors.greenAccent[400],
        title: Text(
          widget.contactName,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Chat').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshotx) {
              if (snapshotx.hasError) {
                return Text("${snapshotx.error}");
              }
              if (snapshotx.connectionState == ConnectionState.waiting) {
                return Text('');
              }
              String x = user.uid.trim() + "-" + passedid.toString().trim();
              String y = passedid.toString().trim() + "-" + user.uid.trim();

              bool alreadychatted = false;
              for (int i = 0; i < snapshotx.data.docs.length; i++) {
                String a =
                    snapshotx.data.docs.elementAt(i).id.toString().trim();
                //print (a);
                if (a == x) {
                  alreadychatted = true;
                  idfirst = true;
                  k = x;
                  break;
                } else if (a == y) {
                  alreadychatted = true;
                  k = y;
                  break;
                } else {
                  k = x;
                }

                //print (k+"bakam");
              }
              if (!alreadychatted) {
                FirebaseFirestore.instance
                    .collection('Chat')
                    .doc(user.uid.toString().trim() +
                        "-" +
                        passedid.toString().trim())
                    .set({'name': "text"});
              } else {
                if (idfirst) {
                  k = user.uid.toString().trim() +
                      "-" +
                      passedid.toString().trim();
                } else {
                  k = passedid.toString().trim() +
                      "-" +
                      user.uid.toString().trim();
                }
                //
                // print (y+"hangisi");
              }
              gelenresimurl = [];
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: 75),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Chat')
                            .doc(k)
                            .collection("Messages")
                            .orderBy("time", descending: false)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('');
                          }

                          List<MessageArray> messagearr = [];
                          //gelenresimurl.clear();
                          snapshot.data.docs.map((doc) {
                            messagearr.add(
                              MessageArray(doc['isencrypted'], doc['message'],
                                  doc['sender_id'], doc.id),
                            );
                            try {
                              if (doc['message'] == "********////") {
                                gelenresimurl = doc['url'];
                                //print(doc['url']);
                              }
                              if (doc['isencrypted'] == true) {
                                if (doc['type'] != "PuzzleQuiz") {
                                  cat = doc['category'];
                                }
                                ty = doc['type'];
                                docn = doc['docname'];
                                dif = doc['difficulty'];
                                switch (dif) {
                                  case 'Easy':
                                    {
                                      maxPoints = 10;
                                      break;
                                    }
                                  case 'Normal':
                                    {
                                      maxPoints = 25;
                                      break;
                                    }
                                  case 'Hard':
                                    {
                                      maxPoints = 50;
                                      break;
                                    }
                                }
                                //print(ty);
                                //print(docn);
                                //print(dif);
                              }
                            } catch (e) {
                              //print(e.toString());
                            }
                          }).toList();

                          return ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.white,
                            ),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              check = messagearr[index].message;
                              //print(check!="********////");
                              /*if(messagearr[index].sender_id==user.uid){
                        }*/
                              //print(snapshot.data.docs.elementAt(index).get('field').toString());
                              if (messagearr[index].isenc &&
                                  messagearr[index].sender_id != user.uid) {
                                return Container(
                                  width: 10,
                                  alignment: Alignment.bottomLeft,
                                  child: Card(
                                    color: Colors.grey[100],
                                    child: TextButton(
                                        child: Text('ENCRYPTED'),
                                        onPressed: () {
                                          qqq = messagearr[index].id;
                                          Navigator.of(context)
                                              .pushNamed('/SolvePuzzle');
                                        }),
                                  ),
                                );
                                //child: Text('ENCRYPTED'),alignment:Alignment.bottomLeft
                                //return Container(child: Text('ENCRYPTED'),alignment:Alignment.bottomRight );
                              } else if (messagearr[index].isenc &&
                                  messagearr[index].sender_id == user.uid) {
                                //print(gelenresimurl);

                                return Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 55.0),
                                      child: Card(
                                        color: Colors.green[400],
                                        child: Padding(
                                            //duzenle(index: index)
                                            padding: const EdgeInsets.all(10.0),
                                            child: check != "********////"
                                                ? Container(
                                                    child: Text(
                                                        snapshot.data.docs
                                                            .elementAt(index)
                                                            .get('message'),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17)),
                                                  )
                                                : FittedBox(
                                                    child: Image.network(
                                                    snapshot.data.docs
                                                        .elementAt(index)
                                                        .get('url'),
                                                    errorBuilder: (BuildContext
                                                            context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                      return Icon(
                                                          Icons.do_not_disturb);
                                                    },
                                                  )) //duzenle(index: index)
                                            ),
                                      ),
                                    ));
                              } else if (!messagearr[index].isenc &&
                                  messagearr[index].sender_id == user.uid) {
                                //print(gelenresimurl);
                                return Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 55.0),
                                    child: Card(
                                      color: Colors.green[400],
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.75),
                                        child: Padding(
                                            //duzenle(index: index)
                                            padding: const EdgeInsets.all(3.75),
                                            child: check != "********////"
                                                ? Container(
                                                    child: Text(
                                                        snapshot.data.docs
                                                            .elementAt(index)
                                                            .get('message'),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17)),
                                                  )
                                                : Container(
                                                    height: 275,
                                                    child: Image.network(
                                                      snapshot.data.docs
                                                          .elementAt(index)
                                                          .get('url'),
                                                      fit: BoxFit.fill,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace
                                                                  stackTrace) {
                                                        return Icon(Icons
                                                            .do_not_disturb);
                                                      },
                                                    )) //duzenle(index: index)
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                        //duzenle(index: index)
                                        padding: const EdgeInsets.all(10.0),
                                        child: check != "********////"
                                            ? Container(
                                                color: Colors.grey[100],
                                                child: Text(
                                                    snapshot.data.docs
                                                        .elementAt(index)
                                                        .get('message'),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17)),
                                              )
                                            : Container(
                                                width: 200,
                                                height: 200,
                                                child: Image.network(
                                                  snapshot.data.docs
                                                      .elementAt(index)
                                                      .get('url'),
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace stackTrace) {
                                                    return Icon(
                                                        Icons.do_not_disturb);
                                                  },
                                                )) //duzenle(index: index)
                                        ));
                              }
                            },
                          );
                        })

                    //insert the messaging part here

                    ,
                  ),
                ),
                isSwitcheden
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 70),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  focusColor: Colors.white,
                                  value: type,
                                  //elevation: 5,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  iconEnabledColor: Colors.black,
                                  items: <String>[
                                    'TextQuiz',
                                    'PhotoQuiz',
                                    'PuzzleQuiz',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    "Type",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      type = value;
                                    });
                                  },
                                ),
                              ),
                              type != 'PuzzleQuiz'
                                  ? Container(
                                      width: 100,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        focusColor: Colors.white,
                                        value: category,
                                        //elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'Math',
                                          'History',
                                          'Science',
                                          'Computer',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Category",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            category = value;
                                          });
                                        },
                                      ),
                                    )
                                  : Container(
                                      width: 0,
                                      height: 0,
                                    ),
                              Container(
                                width: 100,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  focusColor: Colors.white,
                                  value: difficulty,
                                  //elevation: 5,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  iconEnabledColor: Colors.black,
                                  items: <String>[
                                    'Easy',
                                    'Normal',
                                    'Hard',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    "Difficulty",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      difficulty = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Align(
                  // this is the chat part at the below
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                    //child: chatBox(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: MediaQuery.of(context).size.height * 1 / 15,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Material(
                              color: Colors.transparent,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SafeArea(
                                            child: new Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                new ListTile(
                                                  leading:
                                                      new Icon(Icons.camera),
                                                  title: new Text('Camera'),
                                                  onTap: () async {
                                                    await getImage(
                                                        ImageSource.camera);
                                                    //print(_file.path.toString()+"baksana");
                                                    // this is how you dismiss the modal bottom sheet after making a choice
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                Deneme(
                                                                    file:
                                                                        _file)));
                                                  },
                                                ),
                                                new ListTile(
                                                  leading:
                                                      new Icon(Icons.image),
                                                  title: new Text('Gallery'),
                                                  onTap: () async {
                                                    await getImage(
                                                        ImageSource.gallery);
                                                    print(
                                                        _file.path.toString() +
                                                            "baksana");
                                                    // dismiss the modal sheet
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                Deneme(
                                                                    file:
                                                                        _file)));
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  splashRadius: 18,
                                  icon: Padding(
                                    padding: EdgeInsets.only(bottom: 3),
                                    child: Transform.rotate(
                                      angle: pi / 5,
                                      child: Icon(
                                        Icons.attach_file,
                                        color: Colors.pink,
                                        size: 25,
                                        semanticLabel: 'Attachment',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: null,
                              controller: message,
                              cursorColor: Colors.lightBlue,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Material(
                              color: Colors.transparent,
                              shape: CircleBorder(),
                              child: IconButton(
                                splashRadius: 18,
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.green[700],
                                  size: 25,
                                  semanticLabel: 'Send button',
                                ),
                                onPressed: () async {
                                  //sending the message,
                                  //Added extra condition if its empty

                                  if (message.text != '' ||
                                      message.text.isNotEmpty) {
                                    await sendmessage(isSwitcheden);
                                    message.clear();
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]);
            }),
      ),
    );
  }

  bool idfirst = false;

  Future sendmessage(bool isenc) async {
    //Stream <QuerySnapshot> snapshot2 =FirebaseFirestore.instance.collection('Chat').snapshots();
    //var a= await snapshot2.toList();
    //print (a.toString());

    //print(alreadychatted);

    if (difficulty == 'Easy')
      a = 2;
    else if (difficulty == 'Normal')
      a = 3;
    else
      a = 4;
//print(category+"bakk");
//print(type+"bakk");
//print(difficulty+"bakk");
    if (isenc) {
      if (type != "PuzzleQuiz") {
        CollectionReference reference = FirebaseFirestore.instance
            .collection('Puzzles')
            .doc(category)
            .collection(type)
            .doc(difficulty)
            .collection('Results');
        print("qqq");

        QuerySnapshot lll = await reference.snapshots().elementAt(0);
        int len = lll.docs.length;
        docname = lll.docs.elementAt(Random().nextInt(len)).id.toString();
        /*reference.snapshots().listen((event) {
          docname = event.docs.elementAt(Random().nextInt(event.docs.length)).id;
          print(docname.toString() +"bakk");
        }).toString();*/
        print(docname.toString() + "xxx");
        await FirebaseFirestore.instance
            .collection('Chat')
            .doc(k)
            .collection("Messages")
            .doc()
            .set({
          'message': message.text,
          'sender_id': user.uid.toString(),
          'isencrypted': isenc,
          'category': category,
          'type': type,
          'difficulty': difficulty,
          'docname': docname.toString(),
          'time': FieldValue.serverTimestamp()
        });
      } else {
        CollectionReference reference = FirebaseFirestore.instance
            .collection('Puzzles')
            .doc('photo')
            .collection(a.toString());
        QuerySnapshot lll = await reference.snapshots().elementAt(0);
        int len = lll.docs.length;
        docname = lll.docs.elementAt(Random().nextInt(len)).id.toString();

        /* reference.snapshots().listen((event) {
          //print(event.docs.length.toString() + "şş");
          randomsayi = Random().nextInt(event.docs.length);
          docname = event.docs.elementAt(randomsayi).id;
        }).toString();
        //print(docname.toString() + "bakk");
*/
        await FirebaseFirestore.instance
            .collection('Chat')
            .doc(k)
            .collection("Messages")
            .doc()
            .set({
          'message': message.text,
          'sender_id': user.uid.toString(),
          'isencrypted': isenc,
          'docname': docname.toString(),
          'difficulty': difficulty,
          'time': FieldValue.serverTimestamp(),
          'type': "PuzzleQuiz"
        });
      }
    } else {
      await FirebaseFirestore.instance
          .collection('Chat')
          .doc(k)
          .collection("Messages")
          .doc()
          .set({
        'message': message.text,
        'sender_id': user.uid.toString(),
        'isencrypted': isenc,
        'time': FieldValue.serverTimestamp()
      });
    }
  }
}

class MessageArray {
  String id;
  bool isenc;
  String message;
  // ignore: non_constant_identifier_names
  String sender_id;

  MessageArray(this.isenc, this.message, this.sender_id, this.id);
}
