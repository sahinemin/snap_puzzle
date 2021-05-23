import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Settigns Page Class
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitchedNoti = false;
  bool isSwitchedNotiClass = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF003942),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Settings",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: Color(0xFFE19600)),
                  Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              buildSettingsGestureDetector('Change Password'),
              buildSettingsGestureDetector('Social'),
              buildSettingsGestureDetector('Privacy and Security'),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Icon(Icons.notifications, color: Color(0xFFE19600)),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chat Notifications',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Switch(
                      value: isSwitchedNoti,
                      onChanged: (value){
                        setState(() {
                          isSwitchedNoti = value;
                        });},
                      activeTrackColor: Color(0xFFE19600),
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Classroom Notifications',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Switch(
                      value: isSwitchedNotiClass,
                      onChanged: (value){
                        setState(() {
                          isSwitchedNotiClass = value;
                        });},
                      activeTrackColor: Color(0xFFE19600),
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Icon(Icons.games_outlined, color: Color(0xFFE19600)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Text(
                      "Puzzle Settings",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Layouts',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  GestureDetector buildSettingsGestureDetector(String optionTitle) {
    return GestureDetector(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0
          ),
          child: Row(
            children: [
              Text(
                optionTitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        onTap: () {

        },
      ),

    );
  }
}
