import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

TextEditingController message = new TextEditingController();

class chat extends StatelessWidget {

  chat({this.chatName}) : super();

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

final List<String> entries = <String>['1', '2', '3','4', '5', '6','7', '8', '9','10', '11', '12','13', '14', '15','16', '17', '18'];
final List<int> colorCodes = <int>[600, 600, 400, 400, 400, 600, 600, 600, 400,  400,  600, 600,  600, 400,   400, 400,  600,   600];
final List<int> fromLeft = <int>[    0,   0, 240, 240, 240,   0,   0,   0, 240,  240,    0,   0,    0, 240,   240, 240,    0,     0];
final List<int> fromRight = <int>[ 240, 240,   0,   0,   0, 240, 240, 240,   0,    0,  240, 240,  240,   0,     0,   0,  240,   240];

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
                          onPressed: () {
                            if (message.text != '') {
                              entries.add('${message.text}');
                              message.clear();
                              fromLeft.add(240);
                              fromRight.add(0);
                              colorCodes.add(400);
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