import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Course/course.dart';
import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CoursePage(
              courseName: '${widget.title}',
              courseImage: '${widget.image}',
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: width(),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage('${widget.image}'),
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
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return courseCard();
  }
}
