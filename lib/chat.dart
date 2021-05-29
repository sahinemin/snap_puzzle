import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snap_puzzle/contacts.dart';
import 'LogIn.dart';
import 'contacts.dart';

int a;
TextEditingController message = new TextEditingController();
bool isSwitcheden = false;

class chat extends StatelessWidget {
  chat({this.chatName}) : super();

  String chatName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: directContact(chatName)
        // home: DirectContact(contactName: "Contact Name"),
        );
  }
}

class directContact extends StatefulWidget {
  directContact(this.contactName) : super();
  final String contactName;

  @override
  _directContactState createState() => _directContactState();
}

class _directContactState extends State<directContact> {
  @override
  Widget build(BuildContext context) {
    bool _answer = false;
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 75),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Chat')
                      .doc(user.uid + "-" + passedChatName)
                      .collection("Messages")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading:');
                    }
                    a = snapshot.data.size;
                    print(user.uid + "-" + passedChatName);
                    //return ListView.separated(
                    //children: snapshot.data.docs.map((doc) => ListTile(title: Text(doc['receiverid']),subtitle: Text('Emin'),)).toList(),
                    //);

                    List<MessageArray> messagearr = [];
                    snapshot.data.docs.map((doc) {
                      messagearr.add(MessageArray(doc['isencrypted'],
                          doc['message'], doc['sender_id']));
                      print(doc['isencrypted']);
                    }).toList();
                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.white,
                          ),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        /*if(messagearr[index].sender_id==user.uid){
                      }*/
                        if (messagearr[index].isenc &&
                            messagearr[index].sender_id != user.uid) {
                          return Container(
                            width: 10,
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                                child: Text('ENCRYPTED'), onPressed: () {}),
                          );
                          //child: Text('ENCRYPTED'),alignment:Alignment.bottomLeft
                          //return Container(child: Text('ENCRYPTED'),alignment:Alignment.bottomRight );
                        } else if (messagearr[index].isenc &&
                            messagearr[index].sender_id == user.uid) {
                          return Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(left:55.0),
                              child: Card(
                                color: Colors.green[400],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      messagearr[index].message.toString(),
                                      style: TextStyle(color: Colors.white,fontSize: 17)),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(right:50.0),
                              child: Card(
                                color: Colors.grey[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(messagearr[index].message.toString(),
                                      style: TextStyle(color: Colors.black,fontSize: 17)),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  })

              //insert the messaging part here

              ,
            ),
          ),
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
                            onPressed: () {},
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
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
                            if (message.text != '' || message.text.isNotEmpty) {
                              await sendmessage();
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
        ],
      ),
    );
  }

  Future sendmessage() async {
    final DocumentReference userCollection = FirebaseFirestore.instance
        .collection('Chat')
        .doc(user.uid.toString() + "-" + passedChatName)
        .collection("Messages")
        .doc(a.toString());
    await userCollection.set({
      'message': message.text,
      'sender_id': user.uid.toString(),
      'isencrypted': true
    });
  }
}

class MessageArray {
  bool isenc;
  String message;
  String sender_id;

  MessageArray(this.isenc, this.message, this.sender_id);
}
