import 'package:flutter/material.dart';
import 'package:snap_puzzle/LogIn.dart';

var _answer;



class SolveTextQuiz extends StatefulWidget {
  String correctAnswer;
  int maxPoints;
  String desc;
  String sel1;
  String sel2;
  String sel3;
  String sel4;
  @override
  SolveTextQuiz({ this.correctAnswer,
  this.maxPoints,
  this.desc,
  this.sel1,
  this.sel2,
  this.sel3,
  this.sel4,}) : super();
  _SolveTextQuizState createState() => _SolveTextQuizState();
}

class _SolveTextQuizState extends State<SolveTextQuiz> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _answer = null;
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
                    'Solve This Quiz to See the \n                Message',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                      child: Text(widget.desc),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.redAccent[400]),
                      value: 1,
                      groupValue: _answer,
                      onChanged: (value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Text(widget.sel1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.redAccent[400]),
                      value: 2,
                      groupValue: _answer,
                      onChanged: (value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Text(widget.sel2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.redAccent[400]),
                      value: 3,
                      groupValue: _answer,
                      onChanged: (value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Text(widget.sel3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.redAccent[400]),
                      value: 4,
                      groupValue: _answer,
                      onChanged: (value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Text(widget.sel4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                        color: Colors.redAccent[400],
                        child: Text(
                          'submit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        height: 40,
                        minWidth: 120,
                        onPressed: () {
                          if (_answer != null) {
                              if(_answer == widget.correctAnswer) {
                                //Update user's score
                                //Update encryption
                                Navigator.pop(context);
                              }
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
