import 'package:flutter/material.dart';

void main() {
  runApp(profilescreen());
}
class profilescreen extends StatefulWidget {
  const profilescreen({Key key}) : super(key: key);

  @override
  _profilescreenState createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                                    image: DecorationImage(image: NetworkImage('https://lh3.googleusercontent.com/a-/AOh14GizcmzP7CO5wct3xq6ZBTj-SYgPsvjyoQemuIEDbA=s96-c'),fit: BoxFit.fitHeight)
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
                                          //color: Colors.lightBlue,
                                          color: Colors.orange,
                                          width: 500,
                                          child: Text(
                                              "id: 1"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange[300],
                                          child: Text(
                                              "username: Hikmet42"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange,
                                          child: Text(
                                              "name: Hikmet Can"
                                          )
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 500,
                                          //color: Colors.lightBlue,
                                          color: Colors.orange[300],
                                          child: Text(
                                              "surname: Doğancı"
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


