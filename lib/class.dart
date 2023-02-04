import 'package:flutter/material.dart';
import 'dart:math';

TextEditingController message = new TextEditingController();

// ignore: must_be_immutable
class Classroom extends StatelessWidget {
  Classroom({this.chatName}) : super();

  String chatName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: DirectContact(chatName)
        // home: DirectContact(contactName: "Contact Name"),
        );
  }
}

class DirectContact extends StatefulWidget {
  DirectContact(this.contactName) : super();
  final String contactName;

  @override
  _DirectContactState createState() => _DirectContactState();
}

class _DirectContactState extends State<DirectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text(
          widget.contactName,
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //insert the messaging part here

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
                            color: Colors.blue,
                            size: 25,
                            semanticLabel: 'Send button',
                          ),
                          onPressed: () {
                            //sending the message
                            if (message.text != '') {
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
}
