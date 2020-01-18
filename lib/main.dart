import 'package:flutter/material.dart';
import 'home.dart';
import 'list_page.dart';
import 'hyakumeizan_done.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '百名山一覧',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Hyakumeizans(),
    );
  }
}

// This will be changed appropriate name
class Hyakumeizans extends StatefulWidget {
  @override
  _HyakumeizansState createState() => _HyakumeizansState();
}


class _HyakumeizansState extends State<Hyakumeizans> {
  // controller for changing pages
  PageController _pageController;
  int _screen = 0;
  
  // list of display on Navigation Bottom Menu
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        title: Text('List'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.done),
        title: Text('Achieved'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    //create controller
    _pageController = PageController(initialPage: _screen);
  }

  @override
  void dispose() {
    // dispose controller
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _screen = index;
          });
        },

        children: [
          Home(),
          ListPage(),
          HyakumeizanDone(),
        ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screen,
        onTap: (index) {
          setState(() {
            _screen = index;
            _pageController.animateToPage(index, 
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        items: myBottomNavBarItems(),
      ),
    );
  }
}

