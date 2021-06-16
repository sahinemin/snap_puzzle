import 'dart:io';
import 'package:flutter/material.dart';
import 'package:snap_puzzle/chat.dart';
import 'package:snap_puzzle/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'contacts.dart';
import 'dart:math';
import 'LogIn.dart';
var dosyaadi;
String url;
class deneme extends StatefulWidget {
  final File file;
  const deneme({Key key, this.file}) : super(key: key);

  @override
  _denemeState createState() => _denemeState();
}

class _denemeState extends State<deneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(backgroundColor:Colors.greenAccent[400],
      title: Text('photosending'),),
        body: widget.file!=null ?Image.file(widget.file):Text('boş'),
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.redAccent[200],child:Icon(Icons.upload_sharp),
          onPressed: ()async{
           dosyaadi = widget.file.path.split('/').elementAt(widget.file.path.split('/').length-1).toString();
          try {
            final ref = FirebaseStorage.instance.ref(dosyaadi);
            await ref.putFile(widget.file);
            isphoto=true;
            //gelenresimurl.add(await ref.getDownloadURL());
            url=await ref.getDownloadURL();
            await sendmessage(isSwitcheden);

          }
          catch(e){
            print(e.toString());
          }

    },));
  }
}
Future sendmessage(bool isenc) async {
    if(!isenc){
      if(isphoto){
        await FirebaseFirestore.instance.collection('Chat').doc(k).
        collection("Messages")
            .doc().set({
          'isencrypted':isenc,
          'message': "********////",
          'sender_id': user.uid.toString(),
          'url': url,
          'time': FieldValue.serverTimestamp(),
        });

      }

    }
    else{
      if(isphoto){
        if(type!="PuzzleQuiz") {
          CollectionReference reference = FirebaseFirestore.instance.collection(
              'Puzzles').doc(category).collection(type)
              .doc(difficulty)
              .collection('Results');
          reference.snapshots().listen((event) {
            docname = event.docs
                .elementAt(Random().nextInt(event.docs.length))
                .id;
            //print(_docname+"bakk");
          }).toString();
          await FirebaseFirestore.instance.collection('Chat').doc(k).
          collection("Messages")
              .doc().set({
            'message': "********////",
            'sender_id': user.uid.toString(),
            'isencrypted': isenc,
            'category': category,
            'type': type,
            'difficulty': difficulty,
            'docname': docname,
            'url':url,
            'time': FieldValue.serverTimestamp()
          });
        }
        else {
          CollectionReference reference = FirebaseFirestore.instance.collection(
              'Puzzles').doc('photo').collection(a.toString());
          int randomsayi;

          reference.snapshots().listen((event) {
            print(event.docs.length.toString()+"şş");
            randomsayi=Random().nextInt(event.docs.length);
            docname=event.docs.elementAt(randomsayi).id;

          }).toString();


          await FirebaseFirestore.instance.collection('Chat').doc(k).
          collection("Messages")
              .doc().set({
            'message': "********////",
            'sender_id': user.uid.toString(),
            'isencrypted': isenc,
            'docname': docname,
            'difficulty': difficulty,
            'url':url,
            'time': FieldValue.serverTimestamp()
          });
        }

      }


    }

}