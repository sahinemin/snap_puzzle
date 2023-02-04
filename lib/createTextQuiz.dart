import 'package:flutter/material.dart';

import 'Puzzle.dart';

final TextEditingController _descriptionController =
    new TextEditingController();
final TextEditingController _selection1Controller = new TextEditingController();
final TextEditingController _selection2Controller = new TextEditingController();
final TextEditingController _selection3Controller = new TextEditingController();
final TextEditingController _selection4Controller = new TextEditingController();

String _type = 'TextQuiz';
var _answer;
var _category;
var _difficulty;

class CreateTextQuiz extends StatefulWidget {
  @override
  _CreateTextQuizState createState() => _CreateTextQuizState();
}

class _CreateTextQuizState extends State<CreateTextQuiz> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _answer = null;
        _category = null;
        _difficulty = null;
        _descriptionController.clear();
        _selection1Controller.clear();
        _selection2Controller.clear();
        _selection3Controller.clear();
        _selection4Controller.clear();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text('Text Quiz Creator'),
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
                    height: 80,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      maxLength: 75,
                      maxLines: 2,
                      controller: _descriptionController,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Description is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 15),
                        hintText: 'Description',
                        border: InputBorder.none,
                      ),
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
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            maxLength: 30,
                            controller: _selection1Controller,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Selection 1 is empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60, fontSize: 15),
                              hintText: 'Selection 1',
                              border: InputBorder.none,
                            ),
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
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            maxLength: 30,
                            controller: _selection2Controller,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Selection 2 is empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60, fontSize: 15),
                              hintText: 'Selection 2',
                              border: InputBorder.none,
                            ),
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
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            maxLength: 30,
                            controller: _selection3Controller,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Selection 3 is empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60, fontSize: 15),
                              hintText: 'Selection 3',
                              border: InputBorder.none,
                            ),
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
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: new BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            maxLength: 30,
                            controller: _selection4Controller,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Selection 4 is empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  color: Colors.white60, fontSize: 15),
                              hintText: 'Selection 4',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        child: Text(
                          'submit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        height: 40,
                        minWidth: 120,
                        onPressed: () {
                          if (_descriptionController.text.isNotEmpty &&
                              _selection1Controller.text.isNotEmpty &&
                              _selection2Controller.text.isNotEmpty &&
                              _selection3Controller.text.isNotEmpty &&
                              _selection4Controller.text.isNotEmpty &&
                              _answer != null &&
                              _category != null &&
                              _difficulty != null) {
                            TextQuiz textQuiz = new TextQuiz(
                                _type,
                                _category,
                                _difficulty,
                                _descriptionController.text,
                                _selection1Controller.text,
                                _selection2Controller.text,
                                _selection3Controller.text,
                                _selection4Controller.text,
                                _answer.toString());
                            textQuiz.submit();
                            print('success');
                            _answer = null;
                            _category = null;
                            _difficulty = null;
                            _descriptionController.clear();
                            _selection1Controller.clear();
                            _selection2Controller.clear();
                            _selection3Controller.clear();
                            _selection4Controller.clear();
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
