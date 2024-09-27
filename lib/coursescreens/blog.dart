import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class blog extends StatefulWidget {
 blog({super.key});

  @override
  State<blog> createState() => _blogState();
}

class _blogState extends State<blog> {
  final List<Map<String, String>> courses = [
  {
    'imageUrl': 'https://t4.ftcdn.net/jpg/01/40/21/85/240_F_140218536_OlVwQboj3LQv0YXWnk8BXJjtM9QvbwLp.jpg',
    'profileImageUrl': 'https://www.shutterstock.com/image-photo/face-portrait-student-man-university-600nw-2248535531.jpg',
    'name': 'John',
    'title': 'Course Title 1',
    'date': '26 Sep 2024',
    'description': 'Your long text goes here. It should be long enough to test the max lines and ellipsis effect when it overflows the specified max lines. This will help you ensure that it behaves as expected in the layout.'
  },
  {
    'imageUrl': 'https://media.gettyimages.com/id/1348273219/photo/an-anonymous-business-woman-having-conference-call-meeting-on-digital-tablet-in-a-cafe.jpg?s=612x612&w=gi&k=20&c=CJRPX2RojLsdxbsrD9wXmfKrl0rxxqyoqcUBUiUbs_g=',
    'profileImageUrl': 'https://i.pinimg.com/736x/5a/ab/f8/5aabf84d67477f77d3bb8f0fe4cfcd17.jpg',
    'name': 'Mohan',
    'title': 'Course Title 2',
    'date': '27 Sep 2024',
    'description': 'Another description for a different course. It should also check the max lines and overflow behavior.'
  },
  {
    'imageUrl': 'https://t4.ftcdn.net/jpg/01/40/21/85/240_F_140218536_OlVwQboj3LQv0YXWnk8BXJjtM9QvbwLp.jpg',
    'profileImageUrl': 'https://www.shutterstock.com/image-photo/face-portrait-student-man-university-600nw-2248535531.jpg',
    'name': 'John',
    'title': 'Course Title 1',
    'date': '26 Sep 2024',
    'description': 'Your long text goes here. It should be long enough to test the max lines and ellipsis effect when it overflows the specified max lines. This will help you ensure that it behaves as expected in the layout.'
  },
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: ,
        padding: EdgeInsets.only(left: 20,right: 20),
        color: Colors.white.withOpacity(.5),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white.withOpacity(.9),
              margin: EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 170,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            course['imageUrl']!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  child: Image.network(
                                    course['profileImageUrl']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                course['name']!,
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course['title']!, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(
                          course['description']!,
                          style: TextStyle(fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 14,color: Colors.grey[600]),
                                SizedBox(width: 8),
                                Text(
                                  course['date']!,
                                  style: TextStyle(fontSize: 12,color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(Icons.message, size: 14,color: Colors.grey[600]),
                                SizedBox(width: 8),
                                Text(
                                  'Comments',
                                  style: TextStyle(fontSize: 12,color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}