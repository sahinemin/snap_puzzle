import 'package:flutter/material.dart';
var classname;

class Classroom extends StatelessWidget {
  @override
  var List1 = ["Class1","Class2","Class3","Class4", "Class5 (Teacher)"];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color(0xFF003942),
        height: 120.0,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[400],
          ),
          itemCount: List1.length,
          itemBuilder: (BuildContext context, int index){
            if(index == 4) {
              return ListTile(
                  leading: CircleAvatar(),
                  title: Text(List1[index], style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    'Your teacher uploaded a new image, solve a puzzle',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: (){
                    classname= List1[index];
                    Navigator.of(context).pushNamed('/TChatClass');
                  }
              );
            } else {
              return ListTile(
                  leading: CircleAvatar(),
                  title: Text(List1[index], style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    'Your teacher uploaded a new image, solve a puzzle',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: (){
                    classname= List1[index];
                    Navigator.of(context).pushNamed('/ChatClass');
                  }
              );
            }
          },
        ),
      ),
    );
  }
}