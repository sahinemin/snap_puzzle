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
                  'Create Your Own Puzzle!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/CreateTextQuiz');
                },
                leading: CircleAvatar(),
                title: Text('Text Quiz', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/CreatePhotoQuiz');
                },
                leading: CircleAvatar(),
                title: Text('Photo Quiz', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
