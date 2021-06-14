import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LogIn.dart';
import 'Scoreboard.dart';
import 'classroom.dart';
import 'createPuzzle.dart';
import 'profilescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
var passedChatName;
var passedid;
var chats=[];
var words=[];
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
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed('/Friends');}
        ,child: Icon(Icons.message_outlined),
          backgroundColor: Colors.redAccent[400]),
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
          unselectedItemColor: Colors.grey[100],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home Page',
                backgroundColor: Colors.greenAccent[400]),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined),
                label: 'Classes',
                backgroundColor: Colors.greenAccent[400]),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'New Puzzle',
                backgroundColor: Colors.greenAccent[400]),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events_outlined),
                label: 'Scoreboard',
                backgroundColor: Colors.greenAccent[400]),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
                backgroundColor: Colors.greenAccent[400]),
          ],
          onTap: (currentPageNumber) {
            setState(() {
              pageController.jumpToPage(currentPageNumber);
            });
          },
        ),
        appBar: AppBar(
          title: Text(
            'SnapPuzzle',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 24 * MediaQuery.textScaleFactorOf(context),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent[400],
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
        color: Colors.white,
        height: 120.0,
        child: Stack(
          children: [
              StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Chat').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                words.clear();
                chats.clear();
                for(int i=0;i<snapshot.data.size;i++){
                  print(snapshot.data.docs.elementAt(i).id);
                  print(i);
                  String temp=snapshot.data.docs.elementAt(i).id;
                  if(temp.contains(user.uid)){
                    if(temp.split("-")[0]==user.uid)words.add(temp.split("-")[1]);
                      else words.add(temp.split("-")[0]);
                    chats.add(i);
                    print(chats);
                  }
                }
                return Container(width: 0,height: 0,);
               }
               ),
              StreamBuilder(stream: FirebaseFirestore.instance.collection('Users').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Text('Loading:');
                    }

                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[800],
                      ),
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, int index){
                        print(words[index]);
                        var names=[];
                        snapshot.data.docs.map((e) => names.add(e["name"])).toList();
                        return ListTile(
                          onTap: (){
                            passedChatName=names[index];
                            passedid=words[index];
                            print(words[index]);
                            print(passedid);
                            Navigator.of(context).pushNamed('/Chat');
                          },
                          leading: CircleAvatar(backgroundColor: Colors.greenAccent[400]),
                          trailing: Icon(
                            Icons.east_outlined,
                            color: Colors.purple[900],
                          ),
                          title: Text(names[index], style: TextStyle(color: Colors.black)),
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
                    );

                  }),

          ],
        )

        //insert the messaging part here
        ,
      ),
    );
  }
}
