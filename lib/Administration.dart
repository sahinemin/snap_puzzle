import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Administration extends StatelessWidget {
  final List<String> entries = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18'
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500
  ];

  Administration(this.className);

  String className;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xFF003942),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(className),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 350, 15),
                        child: Text(
                          'School Name\nMembers : 18',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 25),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber[colorCodes[index]],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('Student ${entries[index]}'),
                              ),
                              Container(
                                height: 30,
                                child: FloatingActionButton(
                                    heroTag: 'fab_block',
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.block,
                                      size: 20,
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}
