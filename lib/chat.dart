import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class chat extends StatelessWidget {
  chat({this.isClass, this.chatName, this.adminPrivileges}) : super();

  String chatName;
  bool isClass;
  bool adminPrivileges;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isClass
            ? Class(
          className: chatName,
          adminPrivilege: adminPrivileges,
        )
            : directContact(chatName)
      // home: DirectContact(contactName: "Contact Name"),
    );
  }
}

class directContact extends StatelessWidget {
  directContact(this.contactName) : super();
  final String contactName;

  @override
  // _MyHomePageState createState() => _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          contactName,
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Color(0xFF003942),
            child: ListView(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: chatBox(context),
          ),
        ],
      ),
    );
  }
}

class Class extends StatelessWidget {
  Class({this.className, this.adminPrivilege}) : super();
  final String className;
  final bool adminPrivilege;

  @override
  // _MyHomePageState createState() => _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          className,
          style: new TextStyle(color: Colors.white),
        ),
      ),

      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Color(0xFF003942),
            child: ListView(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              adminPrivilege ? teacherView() : studentView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: chatBox(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//the chatbox
chatBox(context) {
  TextEditingController message = new TextEditingController();
  return Container(
    decoration: BoxDecoration(
      color: Color(0x60FFFFFF),
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
            style: TextStyle(fontSize: 18, color: Colors.white70),
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
              onPressed: () {},
            ),
          ),
        ),
      ],
    ),
  );
}

//teacher buttons (scoreboard and administration)
teacherView() {
  return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: () {},
                tooltip: 'Class Settings',
                backgroundColor: Color(0xFFE19600),
                child: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
              child: FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Color(0xFFE19600),
                tooltip: 'Scoreboard',
                child: Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ));
}

//student buttons (scoreboard)
studentView() {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
        child: FloatingActionButton(
          tooltip: 'Scoreboard',
          backgroundColor: Color(0xFFE19600),
          child: Icon(
            Icons.emoji_events,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    ),
  );
}
