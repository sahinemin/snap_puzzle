import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'contacts.dart';

class Friends extends StatefulWidget {
  const Friends({Key key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed('/addfriend');}
          ,child: Icon(Icons.add),
          backgroundColor: Colors.redAccent[400]),
      appBar: AppBar(
        title: Text(
          'SnapPuzzle',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 24 * MediaQuery.textScaleFactorOf(context),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent[400],
        elevation: 5,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Chat').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading:');
            }
            //return ListView.separated(
            //children: snapshot.data.docs.map((doc) => ListTile(title: Text(doc['receiverid']),subtitle: Text('Emin'),)).toList(),
            //);
            var receiver_id = [];
            snapshot.data.docs.map((doc) {
              receiver_id.add(doc['senderid']);
            }).toList();
            //print(receiver_id[0]+"yazdıımm"+receiver_id[1]);
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[800],
              ),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    passedChatName = receiver_id[index];
                    Navigator.of(context).pushNamed('/Chat');
                  },
                  leading:
                      CircleAvatar(backgroundColor: Colors.greenAccent[400]),
                  trailing: Icon(
                    Icons.east_outlined,
                    color: Colors.purple[900],
                  ),
                  title: Text(receiver_id[index].toString(),
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(
                    'Hey wanna see the image? heres a puzzle!',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
