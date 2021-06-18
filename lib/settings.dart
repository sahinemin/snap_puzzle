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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
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
                  Icon(Icons.person, color: Colors.redAccent[400]),
                  SizedBox(width: 15),
                  Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
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
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/AccountDetails');
                },
                title: Text('Change Account Details'),
              ),
            ],
          )),
    );
  }

  GestureDetector buildSettingsGestureDetector(String optionTitle) {
    return GestureDetector(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            children: [
              Text(
                optionTitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
