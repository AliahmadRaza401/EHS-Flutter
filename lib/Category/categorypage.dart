import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Api/apidata.dart';
import 'package:ehs/Course/course.dart';
import 'package:ehs/animations/scaleanimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CategoryPage extends StatefulWidget {
  String name, image;

  CategoryPage({this.name, this.image});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final data = ApiData().fetchCourses();

  //dialog
  dialog(String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Color(0xff3d3dd9),
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //responsive height
  dynamic height() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .34;
    } else {
      return MediaQuery.of(context).size.height * .5;
    }
  }

  //responsive body height
  dynamic bodyHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .27;
    } else {
      return MediaQuery.of(context).size.height * .36;
    }
  }

  //responsive body container height
  dynamic bodyContainerHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .72;
    } else {
      return MediaQuery.of(context).size.height * .9;
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
  Widget categoryImage() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: height(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('${widget.image}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: appBarHeight(),
          child: AppBar(
            title: AutoSizeText(
              '${widget.name}',
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

  //course card
  Widget allCourseCard(
      String cardTitle, String cardSubTitle, String cardImage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          ScaleRoute(
            page: CoursePage(
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
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                cardImage,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(cardTitle),
            subtitle: Text('Credit Hour : $cardSubTitle'),
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
        width: MediaQuery.of(context).size.width * .9,
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Container(
                      height: bodyContainerHeight(),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          if (snapshot.data[i]['course_department'] ==
                              widget.name.toLowerCase()) {
                            return allCourseCard(
                              snapshot.data[i]['course_name'],
                              snapshot.data[i]['course_credit_value'],
                              snapshot.data[i]['course_image'],
                            );
                          }
                          return null;
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.5,
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //courses list
  Widget courseList() {
    return Container(
      margin: EdgeInsets.only(top: bodyHeight()),
      padding: EdgeInsets.only(
        top: 4.0,
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
      child: allCoursesList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f5),
      body: Stack(
        children: [
          categoryImage(),
          courseList(),
        ],
      ),
    );
  }
}
