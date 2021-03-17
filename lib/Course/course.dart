import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  String courseName, courseImage;

  CoursePage({this.courseName, this.courseImage});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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

  dynamic bodyContainerHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .74;
    } else {
      return MediaQuery.of(context).size.height * 1.3;
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
              image: AssetImage('${widget.courseImage}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 80,
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
  Widget courseBody() {
    return Container(
      margin: EdgeInsets.only(top: bodyHeight()),
      padding: EdgeInsets.only(top: 50.0),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CAD \$ 30',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_fill_rounded,
                    size: 50.0,
                    color: Color(0xff3385e8),
                  ),
                  padding: EdgeInsets.all(0),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Paid',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  AutoSizeText(
                    'Code: CS-432',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  AutoSizeText(
                    'Cr. Hr : 3',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
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
                "This is description of the subject that is selected. This is description of the subject that is selected. This is description of the subject that is selected.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0, right: 10.0,),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    size: 36.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            courseIntro(),
            courseBody(),
          ],
        ),
      ),
    );
  }
}
