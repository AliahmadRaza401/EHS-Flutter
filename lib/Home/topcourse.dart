import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Course/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopCourses extends StatefulWidget {
  String title;
  String image;

  TopCourses({this.title, this.image});

  @override
  _TopCoursesState createState() => _TopCoursesState();
}

class _TopCoursesState extends State<TopCourses> {
  // responsive width
  dynamic width() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * .4;
    } else {
      return MediaQuery.of(context).size.width * .26;
    }
  }

  //course card
  Widget courseCard() {
    return OpenContainer(
        transitionDuration: Duration(milliseconds: 600),
        closedColor: Colors.transparent,
        closedElevation: 0.0,
        closedBuilder: (context, openWidget) {
          return GestureDetector(
            onTap: openWidget,
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 14.0),
              width: width(),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('${widget.image}'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(5, 10), // Shadow position
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  '${widget.title}',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 12.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        openBuilder: (context, closeWidget) {
          return CoursePage(
            courseName: '${widget.title}',
            courseImage: '${widget.image}',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return courseCard();
  }
}
