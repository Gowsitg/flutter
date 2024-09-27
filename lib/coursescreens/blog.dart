import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'service.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart' as html_parser;

class blog extends StatefulWidget {
  blog({super.key});

  @override
  State<blog> createState() => _blogState();
}

class _blogState extends State<blog> {
  final serviceFun = CourseService();
  List<dynamic> courses = [];
  
  @override
  void initState() {
    super.initState();
    getList();
  }

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);  
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

String removeHtmlTags(String htmlString) {
  var document = html_parser.parse(htmlString);
  return document.body?.text ?? ''; 
}

  getList() async {
    final res = await serviceFun.getCourse();
    try {
      if (res.statusCode == 200) {
        setState(() {
          Map<String, dynamic> jsonResponse = jsonDecode(res.body);
         courses = jsonResponse['data']['list'];

        });
        print('Res: ${courses}');
      } else {
        print('Error: ${res.statusCode}');
      }
    } catch (error) {
      print('Error: ${error}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: ,
        padding: EdgeInsets.only(left: 20, right: 20),
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
                            course['thumbnail']?? 'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                         Positioned(
                          right: 0,
                                child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                  width: 40,
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
                                        course['review'] ?? '0',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )
                                    ],
                                  )),
                            )),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAd5avdba8EiOZH8lmV3XshrXx7dKRZvhx-A&s',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                course['created_by_name']??'--',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                        Text(course['category_name']?? '--',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(course['title']?? '--',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(
                          removeHtmlTags(course['long_description']?? '--'),
                          style: TextStyle(fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today,
                                    size: 14, color: Colors.grey[600]),
                                SizedBox(width: 8),
                                Text(
                                  formatDate(course['created_at'] ?? '---'),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(Icons.punch_clock_sharp,
                                    size: 14, color: Colors.grey[600]),
                                SizedBox(width: 8),
                                Text(
                                  course['duration'] ?? '--',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //  SizedBox(width: 10),
                        //     Row(
                        //       children: [
                        //         Icon(Icons.message,
                        //             size: 14, color: Colors.grey[600]),
                        //         SizedBox(width: 8),
                        //         Text(
                        //           'Comments',
                        //           style: TextStyle(
                        //               fontSize: 12, color: Colors.grey[600]),
                        //         ),
                        //       ],
                        //     ),
                          
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
