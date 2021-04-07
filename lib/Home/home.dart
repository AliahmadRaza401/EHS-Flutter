import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Api/apidata.dart';
import 'package:ehs/Course/allcourses.dart';
import 'package:ehs/Grades/gradepage.dart';
import 'package:ehs/Home/category.dart';
import 'package:ehs/Home/homeslider.dart';
import 'package:ehs/Home/topcourse.dart';
import 'package:ehs/animations/slideanimation.dart';
import 'package:ehs/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

final searchQuery = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: top_level_instance_method
  final data = ApiData().fetchCourses();
  int _value = 0;

  //dialog
  dynamic dialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notifications'),
          elevation: 2.0,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .9,
                  child: Column(
                    children: [
                      Text("Notification 1"),
                      Text("Notification 2"),
                      Text("Notification 3"),
                      Text("Notification 4"),
                      Text("Notification 5"),
                      Text("Notification 6"),
                      Text("Notification 7"),
                      Text("Notification 8"),
                      Text("Notification 9"),
                      Text("Notification 10"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Got It!',
                style: TextStyle(
                  color: Color(0xff007bff),
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

  //searchBar widget
  Widget searchBar() {
    return TextFormField(
      initialValue: null,
      autocorrect: true,
      controller: searchQuery,
      validator: (query) {
        if (query.isEmpty) {
          return 'Enter Search Query';
        }
        return null;
      },
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        decoration: TextDecoration.none,
      ),
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      cursorWidth: 2.0,
      cursorHeight: 26.0,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        errorStyle: TextStyle(
          fontSize: 15.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff007bff), width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff8cbaf2), width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        border: InputBorder.none,
        hintText: 'Search your course..',
        hintStyle: TextStyle(
          color: Color(0xff007bff),
          fontSize: 16.0,
        ),
        suffixIcon: Container(
          decoration: BoxDecoration(
              color: Color(0xff007bff),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                SlideBottomRoute(
                  page: SearchPage(
                    queryResults: searchQuery.text,
                  ),
                ),
              );
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog();
        },
        elevation: 0.0,
        backgroundColor: Color(0xff007bff),
        child: Icon(
          Icons.notifications_on_rounded,
          size: 34.0,
          color: Color(0xfff2f2f2),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ehsLogo.png"),
              fit: BoxFit.fitWidth,
              colorFilter: ColorFilter.mode(
                Color(0xfff2f2f2).withOpacity(0.05),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Column(
            children: [
              //slider
              SliderHome(),

              //search bar
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 20.0, 10.0, 20.0),
                child: Row(
                  children: [
                    Flexible(
                      child: searchBar(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: _value,
                            iconEnabledColor: Color(0xff007bff),
                            items: [
                              DropdownMenuItem(
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.language_rounded,
                                    size: 44.0,
                                    color: Color(0xff007bff),
                                  ),
                                ),
                                value: 0,
                              ),
                              DropdownMenuItem(
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage:
                                      AssetImage('assets/english.png'),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage:
                                      AssetImage('assets/urdu.png'),
                                ),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage:
                                      AssetImage('assets/french.png'),
                                ),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage:
                                      AssetImage('assets/chinese.png'),
                                ),
                                value: 4,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),

              //category heading
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),

              //category list
              CourseCategory(),

              //grade heading
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Grades",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),

              //grades box
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      OpenContainer(
                          transitionDuration: Duration(milliseconds: 600),
                          closedColor: Colors.transparent,
                          closedElevation: 0.0,
                          closedBuilder: (context, openWidget) {
                            return GestureDetector(
                              onTap: openWidget,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .1,
                                height: MediaQuery.of(context).size.width * .1,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    "9th",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '9',
                              image: 'assets/9th.jpg',
                            );
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      OpenContainer(
                          transitionDuration: Duration(milliseconds: 600),
                          closedColor: Colors.transparent,
                          closedElevation: 0.0,
                          closedBuilder: (context, openWidget) {
                            return GestureDetector(
                              onTap: openWidget,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .1,
                                height: MediaQuery.of(context).size.width * .1,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    "10th",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '10',
                              image: 'assets/10th.jpg',
                            );
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      OpenContainer(
                          transitionDuration: Duration(milliseconds: 600),
                          closedColor: Colors.transparent,
                          closedElevation: 0.0,
                          closedBuilder: (context, openWidget) {
                            return GestureDetector(
                              onTap: openWidget,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .1,
                                height: MediaQuery.of(context).size.width * .1,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    "11th",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '11',
                              image: 'assets/11th.jpg',
                            );
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      OpenContainer(
                          transitionDuration: Duration(milliseconds: 600),
                          closedColor: Colors.transparent,
                          closedElevation: 0.0,
                          closedBuilder: (context, openWidget) {
                            return GestureDetector(
                              onTap: openWidget,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .1,
                                height: MediaQuery.of(context).size.width * .1,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    "12th",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '12',
                              image: 'assets/12th.jpg',
                            );
                          }),
                    ],
                  ),
                ],
              ),

              //Top courses heading
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Top Courses",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    OpenContainer(
                        transitionDuration: Duration(milliseconds: 600),
                        closedColor: Colors.transparent,
                        closedElevation: 0.0,
                        closedBuilder: (context, openWidget) {
                          return TextButton(
                            onPressed: openWidget,
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Color(0xff007bff),
                                fontSize: 16.0,
                              ),
                            ),
                          );
                        },
                        openBuilder: (context, closeWidget) {
                          return AllCourses();
                        }),
                  ],
                ),
              ),

              FutureBuilder(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length >= 6) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          runSpacing: 20.0,
                          spacing: 20.0,
                          children: [
                            TopCourses(
                              title: snapshot.data[0]["course_name"],
                              image: snapshot.data[0]["course_image"],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25.0,
                              ),
                              child: TopCourses(
                                title: snapshot.data[1]["course_name"],
                                image: snapshot.data[1]["course_image"],
                              ),
                            ),
                            TopCourses(
                              title: snapshot.data[2]["course_name"],
                              image: snapshot.data[2]["course_image"],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25.0,
                              ),
                              child: TopCourses(
                                title: snapshot.data[3]["course_name"],
                                image: snapshot.data[3]["course_image"],
                              ),
                            ),
                            TopCourses(
                              title: snapshot.data[4]["course_name"],
                              image: snapshot.data[4]["course_image"],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25.0,
                              ),
                              child: TopCourses(
                                title: snapshot.data[5]["course_name"],
                                image: snapshot.data[5]["course_image"],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          runSpacing: 20.0,
                          spacing: 20.0,
                          children: [
                            TopCourses(
                              title: snapshot.data[0]["course_name"],
                              image: snapshot.data[0]["course_image"],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25.0,
                              ),
                              child: TopCourses(
                                title: snapshot.data[1]["course_name"],
                                image: snapshot.data[1]["course_image"],
                              ),
                            ),
                            TopCourses(
                              title: snapshot.data[2]["course_name"],
                              image: snapshot.data[2]["course_image"],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25.0,
                              ),
                              child: TopCourses(
                                title: snapshot.data[3]["course_name"],
                                image: snapshot.data[3]["course_image"],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .9,
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
                    height: MediaQuery.of(context).size.height * .9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            JumpingText(
                              "Elite High School...",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Color(0xff3384e8),
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
      ),
    );
  }
}
