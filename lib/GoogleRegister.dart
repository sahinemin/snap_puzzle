import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _schoolController = TextEditingController();

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xFF003942),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Register with Google'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Container(
                    child: Text('Please fill the missing information to \ncomplete your registration', maxLines: 2, textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                ),
                Container(
                    height: 60,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: new BoxDecoration(
                      color: Color(0x60FFFFFF),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child:TextFormField(
                      controller: _nameController,
                      /* validator: (String val){
                        if(val.isEmpty){
                          return "Please enter a name";
                        }
                        return null;
                      },*/
                      obscureText: false,
                      decoration:  InputDecoration(
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),

                      ),
                    ) ),
                Container(
                    height: 60,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.all(20),
                    decoration: new BoxDecoration(
                      color: Color(0x60FFFFFF),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child:TextFormField(
                      controller: _schoolController,
                      /*  validator: (String val){
                        if(val.isEmpty){
                          return "Please enter an school";
                        }
                        return null;
                      },*/
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: "School",
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),
                      ),


                    ) ),


                MaterialButton(
                  color: Color(0xFFE19600),
                  height: 50,
                  minWidth: 150,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text('REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () //async
                  {
                    //    _Register();
                  },
                )
              ],
            )));
  }
}
