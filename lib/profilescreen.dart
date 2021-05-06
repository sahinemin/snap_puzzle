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
              appBar: AppBar(
                title: Text("SnapPuzzle"),
                centerTitle: true,
              ),
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
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              '''
id: 1

username: Hikmet42
             
name: Hikmet Can
                    
surname: Doğancı

School name: Agü

                    ''',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                            ),
                            alignment: Alignment.topLeft,
                          ),
                          /*ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60,
                      color: Colors.amber,
                      child: Center(
                          child: Text("contacts here")
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                ),*/
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(padding:const EdgeInsets.all(8),child: Icon(Icons.home,size: 50,)),
                        Container(padding:const EdgeInsets.all(8),child: Icon(Icons.chat,size: 50,)),
                        Container(padding:const EdgeInsets.all(8),child: Icon(Icons.account_circle,size: 50,))
                      ],
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}


