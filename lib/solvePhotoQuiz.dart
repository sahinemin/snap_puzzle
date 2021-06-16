import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController _answerController = new TextEditingController();

class SolvePhotoQuiz extends StatefulWidget {
  @override
  //SolvePhotoQuiz({}) : super();
  _SolvePhotoQuizState createState() => _SolvePhotoQuizState();
}

class _SolvePhotoQuizState extends State<SolvePhotoQuiz> {

  @override
  void initState() {
    var resultsCol = FirebaseFirestore.instance
        .collection('Puzzles')
        /*.doc(category)
        .collection('PhotoQuiz)
        .doc(difficulty)*/
        .doc('Math')
        .collection('PhotoQuiz')
        .doc('Normal')
        .collection('Results');

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _answerController.clear();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text('Quiz'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Solve This Quiz to See \n        the Message!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/250?image=9'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      maxLength: 50,
                      maxLines: 1,
                      controller: _answerController,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Answer is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 15),
                        hintText: 'Answer',
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                        color: Colors.redAccent[400],
                        child: Text('submit',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        height: 40,
                        minWidth: 120,
                        onPressed: () {
                          if (!_answerController.text.isEmpty) {

                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
