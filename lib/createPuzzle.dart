import 'package:flutter/material.dart';

final TextEditingController _descriptionController =
    new TextEditingController();
final TextEditingController _selection1Controller = new TextEditingController();
final TextEditingController _selection2Controller = new TextEditingController();
final TextEditingController _selection3Controller = new TextEditingController();
final TextEditingController _selection4Controller = new TextEditingController();

var _answer = 1;

class CreatePuzzle extends StatefulWidget {
  @override
  _CreatePuzzleState createState() => _CreatePuzzleState();
}

class _CreatePuzzleState extends State<CreatePuzzle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color(0xFF003942),
        height: 120.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Column(
            children: [
              Container(
                child: Text(
                  'Create Your Own Quiz!',
                  style: TextStyle(
                    color: Colors.white,
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
                    color: Color(0x60FFFFFF),
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
                      hintStyle: TextStyle(color: Colors.white60, fontSize: 15),
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
                        (states) => Colors.orange),
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
                          color: Color(0x60FFFFFF),
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
                            hintStyle:
                                TextStyle(color: Colors.white60, fontSize: 15),
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
                        (states) => Colors.orange),
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
                          color: Color(0x60FFFFFF),
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
                            hintStyle:
                                TextStyle(color: Colors.white60, fontSize: 15),
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
                        (states) => Colors.orange),
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
                          color: Color(0x60FFFFFF),
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
                            hintStyle:
                                TextStyle(color: Colors.white60, fontSize: 15),
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
                        (states) => Colors.orange),
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
                          color: Color(0x60FFFFFF),
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
                            hintStyle:
                                TextStyle(color: Colors.white60, fontSize: 15),
                            hintText: 'Selection 4',
                            border: InputBorder.none,
                          ),
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
                      color: Colors.orange,
                      child: Text('submit'),
                      height: 40,
                      minWidth: 120,
                      onPressed: () => print(_answer)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
