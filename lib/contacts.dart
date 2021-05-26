import 'package:flutter/material.dart';
import 'Scoreboard.dart';
import 'classroom.dart';
import 'createPuzzle.dart';
import 'profilescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
var passedChatName;
String passedindex;
String message;
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _ExactPageNumber = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF003942),
        body: PageView(
          // physics: NeverScrollableScrollPhysics(),
          onPageChanged: (pageNo) {
            setState(() {
              _ExactPageNumber = pageNo++;
            });
          },
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Page1(),
            Classroom(),
            CreatePuzzle(),
            Scoreboard(),
            profilescreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //type: BottomNavigationBarType.fixed, //this will make background have color from backgroundColor and make lables always appear. if you want shifting type with color, give items color one by one
          //backgroundColor: Color(0xFFE19600),
          currentIndex: _ExactPageNumber,
          selectedItemColor: Color(0xFF003942),
          unselectedItemColor: Colors.grey[350],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home Page',
                backgroundColor: Color(0xFFE19600)),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined),
                label: 'Classes',
                backgroundColor: Color(0xFFE19600)),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'New Puzzle',
                backgroundColor: Color(0xFFE19600)),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events_outlined),
                label: 'Scoreboard',
                backgroundColor: Color(0xFFE19600)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
                backgroundColor: Color(0xFFE19600)),
          ],
          onTap: (currentPageNumber) {
            setState(() {
              pageController.jumpToPage(currentPageNumber);
            });
          },
        ),
        appBar: AppBar(
          title: const Text('SnapPuzzle'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 5,
        ));
  }
}

class Page1 extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color(0xFF003942),
        height: 120.0,
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection('Chat').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return Text('Loading:');
              }
              //return ListView.separated(
              //children: snapshot.data.docs.map((doc) => ListTile(title: Text(doc['receiverid']),subtitle: Text('Emin'),)).toList(),
              //);
              var receiver_id =[];
              snapshot.data.docs.map((doc) {receiver_id.add(doc['senderid']);} ).toList();
              //print(receiver_id[0]+"yazdıımm"+receiver_id[1]);
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[400],
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    onTap: (){
                      passedChatName=receiver_id[index];
                      Navigator.of(context).pushNamed('/Chat');
                    },
                    leading: CircleAvatar(),
                    title: Text(receiver_id[index].toString(), style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                      'Hey wanna see the image? heres a puzzle!',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              );

            })


        //insert the messaging part here

        ,
      ),
    );



  }
}
