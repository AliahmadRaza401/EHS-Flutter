import 'package:ehs/Course/course.dart';
import 'package:flutter/material.dart';

class AllCourses extends StatefulWidget {
  @override
  _AllCoursesState createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  //course card
  Widget allCourseCard(
      String cardTitle, String cardSubTitle, String cardImage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CoursePage(
              courseName: cardTitle,
              courseImage: cardImage,
            ),
          ),
        );
      },
      child: Container(
        height: 100.0,
        padding: EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                cardImage,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(cardTitle),
            subtitle: Text(cardSubTitle),
            trailing: Icon(
              Icons.navigate_next_rounded,
              color: Color(0xff3385e3),
              size: 44.0,
            ),
          ),
        ),
      ),
    );
  }

  //course card list
  Widget allCoursesList() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * .94,
        child: ListView(
          children: <Widget>[
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
            allCourseCard(
                'Subject 1', 'Credit Hour : 3', 'assets/sliderimage.jpg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f5),
      appBar: AppBar(
        title: Text(
          "All Courses",
          style: TextStyle(
            color: Color(0xff3385e8),
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff2f3f5),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color(0xff3385e8),
          size: 50.0,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: allCoursesList()),
    );
  }
}
