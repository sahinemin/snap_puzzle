import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_puzzle/profilescreen.dart';

import 'contacts.dart';

TextEditingController friendname = new TextEditingController();

class addfriend extends StatefulWidget {
  const addfriend({Key key}) : super(key: key);

  @override
  _addfriendState createState() => _addfriendState();
}

class _addfriendState extends State<addfriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 55,
            margin: EdgeInsets.only(left: 20, right: 20,top:20),
            decoration: new BoxDecoration(
              color: Colors.redAccent[400],
              borderRadius: new BorderRadius.all(Radius.circular(25)),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: ListTile(
              leading: Icon(Icons.search, color: Colors.black),
              title: TextField(
                controller: friendname,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Search...',
                  border:InputBorder.none,
                ),
                onSubmitted: (text)
                {
                  friendname.text;
                  setState(() {});
                },
              ),
            ),
          ),
          SizedBox(height: 20,),
          Flexible(
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('Users').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Text('Loading:');
                  }
                  var names =[];
                  var namesbool =[];
                  var indexes=[];
                  for(int i=0;i<snapshot.data.docs.length;i++){
                    names.add(snapshot.data.docs.elementAt(i).get("name"));
                  }
                  print(names);
                  for(int i=0;i<names.length;i++){
                    if(names[i].toString().contains(friendname.text)){
                      namesbool.add(true);
                      indexes.add(i);
                    }
                  }
                  print(namesbool.length);
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[800],
                    ),
                    itemCount: indexes.length,
                    itemBuilder: (BuildContext context, int index){
                      if(names[indexes[index]].toString().contains(friendname.text)){
                        print(names[indexes[index]]);
                        print(indexes);
                        return ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(profilescreen.photo),),
                          trailing: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.purple[900],
                            onPressed: (){
                            },
                          ),
                          title: Text(names[indexes[index]].toString(), style: TextStyle(color: Colors.black)),
                        );
                      }else{
                        print("Dude why are you even here?");
                        return Container(width: 0,height: 0,);
                      }
                    },
                  );

                }),
          )
        ],
      )
    );
  }
}
