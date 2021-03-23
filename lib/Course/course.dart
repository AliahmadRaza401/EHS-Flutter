import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Api/apidata.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CoursePage extends StatefulWidget {
  String courseName, courseImage;

  CoursePage({this.courseName, this.courseImage});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final data = ApiData().fetchCourses();

  //responsive height
  dynamic height() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .34;
    } else {
      return MediaQuery.of(context).size.height * .66;
    }
  }

  //responsive body height
  dynamic bodyHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .27;
    } else {
      return MediaQuery.of(context).size.height * .5;
    }
  }

  //responsive body container height
  dynamic bodyContainerHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .74;
    } else {
      return MediaQuery.of(context).size.height * 1.3;
    }
  }

  //responsive appbar height
  dynamic appBarHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .1;
    } else {
      return MediaQuery.of(context).size.height * .17;
    }
  }

  //category image
  Widget courseIntro() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: height(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${widget.courseImage}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: appBarHeight(),
          child: AppBar(
            title: Text(
              '${widget.courseName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xfff2f3f5).withOpacity(.3),
            elevation: 2.0,
          ),
        ),
      ],
    );
  }

  //course body
  Widget courseBody(
    String courseType,
    String courseCode,
    String courseCr,
    String courseDesc,
  ) {
    return Container(
      margin: EdgeInsets.only(top: bodyHeight()),
      padding: EdgeInsets.only(
        top: 50.0,
        bottom: 30.0,
      ),
      width: MediaQuery.of(context).size.width,
      height: bodyContainerHeight(),
      decoration: BoxDecoration(
        color: Color(0xfff2f3f5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    courseCode,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      courseType,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    AutoSizeText(
                      'Cr. Hr : $courseCr',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff3385e8),
                      ),
                    ),
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                    ),
                    label: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff3385e8),
                      ),
                    ),
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      size: 30.0,
                    ),
                    label: Text(
                      "Preview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: AutoSizeText(
                  courseDesc,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Prerequisites",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: AutoSizeText(
                  courseDesc,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data.length; i++) {
              if (snapshot.data[i]["course_name"] == widget.courseName) {
                return Stack(
                  children: [
                    courseIntro(),
                    courseBody(
                      snapshot.data[i]["course_type"],
                      snapshot.data[i]["course_code"],
                      snapshot.data[i]["course_credit_value"],
                      snapshot.data[i]["course_description"],
                    ),
                  ],
                );
              }
            }
          } else if (snapshot.hasError) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 80.0,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Internet Connection!",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 2.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    JumpingText(
                      "Elite High School...",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff3395e8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
