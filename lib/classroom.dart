import 'package:flutter/material.dart';

class Classroom extends StatelessWidget {
  @override
  var List1 = ["Class1","Class2","Class3","Class4"];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.0,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[600],
          ),
          itemCount: List1.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: CircleAvatar(),
              title: Text(List1[index]),
              subtitle: Text(
                'Your hocam uploaded a new image, solve a puzzle',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.of(context).pushNamed('/ChatClass');
              }
            );
          },
        ),
      ),
    );
  }
}