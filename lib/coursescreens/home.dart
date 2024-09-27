import 'package:flutter/material.dart';
import 'sideNav.dart';
import 'newCourse.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.menu, size: 30, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('Let\'s Start',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'What are you going to find?',
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
       drawer: SideNavbar(),
     body: Newcourse()
    );
  }
}
