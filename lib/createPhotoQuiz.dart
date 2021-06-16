import 'package:flutter/material.dart';
import 'Puzzle.dart';

final TextEditingController _URLController = new TextEditingController();
final TextEditingController _answerController = new TextEditingController();

var _type = 'PhotoQuiz';
var _category;
var _difficulty;

class CreatePhotoQuiz extends StatefulWidget {
  @override
  _CreatePhotoQuizState createState() => _CreatePhotoQuizState();
}

class _CreatePhotoQuizState extends State<CreatePhotoQuiz> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _category = null;
        _difficulty = null;
        _URLController.clear();
        _answerController.clear();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text('Photo Quiz Creator'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Create Your Own Quiz!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
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
                      maxLength: 250,
                      maxLines: 1,
                      controller: _URLController,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "URL is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 15),
                        hintText: 'Image URL',
                        border: InputBorder.none,
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
                      decoration: InputDecoration.collapsed(
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 15),
                        hintText: 'Answer',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: _category,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Math',
                          'History',
                          'Science',
                          'Computer',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Please choose a category",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _category = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 150,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: _difficulty,
                        //elevation: 5,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Easy',
                          'Normal',
                          'Hard',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Please choose a difficulty",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _difficulty = value;
                          });
                        },
                      ),
                    ),
                  ],
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
                          if (_category != null &&
                              _difficulty != null &&
                              !_URLController.text.isEmpty &&
                              !_answerController.text.isEmpty) {
                            PhotoQuiz photoQuiz = new PhotoQuiz(
                                _type,
                                _category,
                                _difficulty,
                                _URLController.text,
                                _answerController.text);
                            photoQuiz.submit();
                            print('success');
                            _category = null;
                            _difficulty = null;
                            _URLController.clear();
                            _answerController.clear();
                            Navigator.pop(context);
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
