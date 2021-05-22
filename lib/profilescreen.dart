import 'package:flutter/material.dart';
import 'package:snap_puzzle/LogIn.dart';

void main() {
  runApp(profilescreen());
}
class profilescreen extends StatefulWidget {
  static String fullname;
  static String photo;
  const profilescreen({Key key}) : super(key: key);
  @override
  _profilescreenState createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    if(profilescreen.photo==null)profilescreen.photo='https://via.placeholder.com/150';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              body: SafeArea(
                  child: Container(
                    color: Color(0xFF003942),
                    child: Column(

                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: NetworkImage(profilescreen.photo),fit: BoxFit.fitHeight)
                                  ),
                                  height:200,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          color: Colors.orange,
                                          //color: Colors.lightBlue,
                                          child: Text(
                                              "username: Hikmet42"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange[300],
                                          child: Text(
                                              "Fullname: ${profilescreen.fullname}"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          color: Colors.orange,
                                          //color: Colors.lightBlue,
                                          child: Text(
                                              "School name: Agü"
                                          )
                                      ),
                                    ],
                                  )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FloatingActionButton(child: Icon(Icons.settings)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

              ),
            )
        )
    );
  }
}


