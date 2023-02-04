import 'package:flutter/material.dart';
import 'package:snap_puzzle/Puzzle.dart';

final TextEditingController _urlController = new TextEditingController();

var _difficulty;

class SendPuzzle extends StatefulWidget {
  const SendPuzzle({Key key}) : super(key: key);

  @override
  _SendPuzzleState createState() => _SendPuzzleState();
}

class _SendPuzzleState extends State<SendPuzzle> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _difficulty = null;
        _urlController.clear();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text('Puzzle Quiz Creator'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Create Your Own Puzzle!',
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
                      controller: _urlController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 200,
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
                          if (_difficulty != null &&
                              _urlController.text.isNotEmpty) {
                            PuzzleQuiz puzzleQuiz = new PuzzleQuiz(
                              _difficulty,
                              _urlController.text,
                            );
                            puzzleQuiz.submit();
                            print('success');
                            _difficulty = null;
                            _urlController.clear();
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
