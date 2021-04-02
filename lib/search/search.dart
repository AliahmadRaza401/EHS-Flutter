import 'package:ehs/Api/apidata.dart';
import 'package:ehs/Course/course.dart';
import 'package:ehs/animations/scaleanimation.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  String queryResults;

  SearchPage({this.queryResults});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // ignore: top_level_instance_method
  final data = ApiData().fetchCourses();

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
              image: AssetImage('assets/search.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: appBarHeight(),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            backgroundColor: Color(0xfff2f2f2).withOpacity(.3),
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
                          if (widget.queryResults.isEmpty) {
                            return SizedBox(
                              height: 0.0,
                            );
                          }
                          else if (snapshot.data[i]['course_name'].toString().toLowerCase().contains(widget.queryResults.toLowerCase())) {
                            return allCourseCard(
                              snapshot.data[i]['course_name'],
                              snapshot.data[i]['course_credit_value'],
                              snapshot.data[i]['course_image'],
                            );
                          }
                          else{
                            return SizedBox(
                              height: 0.0,
                            );
                          }
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .6,
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
                              color: Color(0xff007bff),
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
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        image: DecorationImage(
          image: AssetImage("assets/ehsLogo.png"),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
            Color(0xfff2f2f2).withOpacity(0.05),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: allCoursesList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: [
          categoryImage(),
          courseList(),
        ],
      ),
    );
  }
}
