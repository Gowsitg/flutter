import 'package:flutter/material.dart';

class Newcourse extends StatefulWidget {
  const Newcourse({super.key});

  @override
  State<Newcourse> createState() => _NewcourseState();
}

void onPressed() {}

class _NewcourseState extends State<Newcourse> {
  final List<Map<String, String?>> courseslist = [
    {
      'imageUrl':
          'https://media.gettyimages.com/id/1348273219/photo/an-anonymous-business-woman-having-conference-call-meeting-on-digital-tablet-in-a-cafe.jpg?s=612x612&w=gi&k=20&c=CJRPX2RojLsdxbsrD9wXmfKrl0rxxqyoqcUBUiUbs_g=',
      'rating': '3',
      'title': 'Course Title 1',
      'name': 'John',
      'time': '11:29',
    },
    {
      'imageUrl':
          'https://t4.ftcdn.net/jpg/01/40/21/85/240_F_140218536_OlVwQboj3LQv0YXWnk8BXJjtM9QvbwLp.jpg',
      'rating': '4',
      'title': 'Course Title 1',
      'name': 'Mohan',
      'time': '11:23',
    },
    {
      'imageUrl':
          'https://i.pinimg.com/736x/5a/ab/f8/5aabf84d67477f77d3bb8f0fe4cfcd17.jpg',
      'rating': '2',
      'title': 'Course Title 4',
      'name': 'John',
      'time': '01:23',
    },
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
  crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Newest Class',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Wrap(
            spacing: 15,
            runSpacing: 24,
            children: [
              for (var course in courseslist)
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    children: [
                      Card(
                          child: Container(
                        height: 130,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: Image.network(
                                course['imageUrl'] ??
                                    'https://via.placeholder.com/150',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                  width: 32,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        course['rating'] ?? '0',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )
                                    ],
                                  )),
                            )),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course['title'] ?? '--',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.person, size: 14,color: Colors.grey[600],),
                                    SizedBox(width: 2),
                                    Text(
                                      course['name'] ?? '--',
                                      style: TextStyle(fontSize: 12,color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 14,color: Colors.grey[600],),
                                  SizedBox(width: 2),
                                  Text(
                                    course['time'] ?? '--',
                                    style: TextStyle(fontSize: 12,color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
            ],
          ),
        )
        ]
        ),

      
      ),
    );
  }
}
