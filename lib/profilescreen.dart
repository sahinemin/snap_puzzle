import 'package:flutter/material.dart';

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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height:200,
                          child: Image.network('https://placekitten.com/g/200/200'),
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
                                      color: Colors.orange,
                                      width: 500,
                                      child: Text(
                                          "id: 1"
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      width: 500,
                                      color: Colors.orangeAccent,
                                      child: Text(
                                          "username: Hikmet42"
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      width: 500,
                                      color: Colors.orange,
                                      child: Text(
                                          "name: Hikmet Can"
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      width: 500,
                                      color: Colors.orangeAccent,
                                      child: Text(
                                          "surname: Doğancı"
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      width: 500,
                                      color: Colors.orange,
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
                                  FloatingActionButton(child: Icon(Icons.settings),onPressed: (){

                                  },),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}


