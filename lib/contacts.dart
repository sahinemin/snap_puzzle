import 'package:flutter/material.dart';

void main() {
  runApp(SwipeablePage());
}

class SwipeablePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),

    );
  }
}

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
        body: PageView(
          // physics: NeverScrollableScrollPhysics(),
          // onPageChanged: (pageNo) {
          //   setState(() {
          //     _ExactPageNumber = pageNo++;
          //   });
          // },
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Page1(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _ExactPageNumber,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey[350],
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home Page'),
            BottomNavigationBarItem(
                icon: Icon(Icons.new_releases), label: 'New Books'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Profile'),
          ],
          onTap: (currentPageNumber) {
            setState(() {
              pageController.jumpToPage(currentPageNumber);
            });
          },
        ),
        appBar: AppBar( title: const Text('SnapPuzzle'),)
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  var List1 = ["User1","User2","User3","User4","User5","User6"];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.0,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[560],
          ),
          itemCount: List1.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: CircleAvatar(),
              title: Text(List1[index]),
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
        ),
      ),
    );
  }
}



