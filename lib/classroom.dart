import 'package:flutter/material.dart';
var classname;

var passedClassName;

class Classroom extends StatelessWidget {
  @override
  var List1 = ["Classroom1","Classroom2","Classroom3","Classroom4","Classroom5"];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: 120.0,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[800],
          ),
          itemCount: List1.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: (){
                passedClassName = List1[index];
                Navigator.of(context).pushNamed('/Class');
              },
              leading: CircleAvatar(backgroundColor: Colors.greenAccent[400],),
              trailing: Icon(
                Icons.east_outlined,
                color: Colors.purple[900],
              ),
              title: Text(List1[index], style: TextStyle(color: Colors.black)),
              subtitle: Text(
                'Hey wanna see the image? heres a puzzle!',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}