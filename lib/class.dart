import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

TextEditingController message = new TextEditingController();

class classroom extends StatelessWidget {

  classroom({this.chatName}) : super();

  String chatName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: directContact(chatName)
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
    return Scaffold(
      backgroundColor: Color(0xFF003942),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.contactName,
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          //insert the messaging part here

          Align(// this is the chat part at the below
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
              //child: chatBox(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                          onPressed: () { //sending the message
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