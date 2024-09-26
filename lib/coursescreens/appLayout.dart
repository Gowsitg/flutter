import 'package:flutter/material.dart';
import 'home.dart';
import 'blog.dart';
import 'sideNav.dart';

void main() {
  runApp(MaterialApp(home: AppLayout()));
}

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List of widgets to display for each tab (Screens)
  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    blog(),
    blog(),
  ];

  final List<String> _titles = <String>[
    'Home',
    'Blog',
    'Classes',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _selectedIndex == 0
          ? null
          : AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
              leading: IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
                ),
                icon: Icon(Icons.menu, size: 30, color: Colors.black),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_titles[_selectedIndex], textAlign: TextAlign.center)
                ],
              ),
            ),
      drawer: SideNavbar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.golf_course),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_rounded),
            label: 'Classes',
          ),
        ],
        currentIndex: _selectedIndex, 
        selectedItemColor: Colors.blue, 
        onTap: _onItemTapped, 
      ),
    );
  }
}
