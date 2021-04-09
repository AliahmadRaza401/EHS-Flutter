import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Api/apidata.dart';
import 'package:ehs/Course/allcourses.dart';
import 'package:ehs/Grades/gradepage.dart';
import 'package:ehs/Home/category.dart';
import 'package:ehs/Home/homeslider.dart';
import 'package:ehs/Home/topcourse.dart';
import 'package:ehs/Localization/language.dart';
import 'package:ehs/Localization/language_constants.dart';
import 'package:ehs/animations/slideanimation.dart';
import 'package:ehs/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../main.dart';

final searchQuery = TextEditingController();

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: top_level_instance_method
  final data = ApiData().fetchCourses();

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  //dialog
  dynamic dialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            getTranslated(context, 'Notifications'),
          ),
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
                getTranslated(context, 'Got_It'),
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
            borderRadius: BorderRadius.circular(12.0),
          ),
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
                      child: DropdownButton<Language>(
                        underline: SizedBox(),
                        icon: Icon(
                          Icons.language_rounded,
                          size: 44.0,
                          color: Color(0xff007bff),
                        ),
                        onChanged: (Language language) {
                          _changeLanguage(language);
                        },
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>(
                              (e) => DropdownMenuItem<Language>(
                                value: e,
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage: AssetImage(e.flag),
                                ),
                              ),
                            )
                            .toList(),
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
                      getTranslated(context, 'Category_heading'),
                      // "Categories",
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
                      getTranslated(context, 'Grades'),
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
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    getTranslated(context, '9th'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '9',
                              title: getTranslated(context, '9th'),
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
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    getTranslated(context, '10th'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '10',
                              title: getTranslated(context, '10th'),
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
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    getTranslated(context, '11th'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '11',
                              title: getTranslated(context, '11th'),
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
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    getTranslated(context, '12th'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, closeWidget) {
                            return GradePage(
                              name: '12',
                              title: getTranslated(context, '12th'),
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
                      getTranslated(context, 'Top_Courses'),
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
                              getTranslated(context, 'See_All'),
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
                                getTranslated(
                                    context, "No_Internet_Connection!"),
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
