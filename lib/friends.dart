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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed('/addfriend');
      }
          , child: Icon(Icons.add),
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
            var receiver_id = [];
            snapshot.data.docs.map((doc) {
              receiver_id.add(doc['senderid']);
            }).toList();
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Users')
                  .doc('6T7CtmUj4PgsGPmQIAgM9DRq7y42')
                  .collection('Friends')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {return Container(width: 0,height: 0,);}
                if (snapshot.hasError) {return Container(width: 0,height: 0,);}
                var friends = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  friends.add(snapshot.data.docs.elementAt(i).get('name').toString());
                }
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(
                        color: Colors.grey[800],
                      ),
                  itemCount: friends.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        passedChatName = friends[index];
                        Navigator.of(context).pushNamed('/Chat');
                      },
                      leading:
                      CircleAvatar(backgroundColor: Colors.greenAccent[400]),
                      trailing: Icon(
                        Icons.east_outlined,
                        color: Colors.purple[900],
                      ),
                      title: Text(friends[index].toString(),
                          style: TextStyle(color: Colors.black)),
                    );
                  },
                );
              },
            );
          }
      ),
    );
  }
}
