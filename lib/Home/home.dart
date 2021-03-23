import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Api/apidata.dart';
import 'package:ehs/Course/allcourses.dart';
import 'package:ehs/Home/category.dart';
import 'package:ehs/Home/homeslider.dart';
import 'package:ehs/Home/topcourse.dart';
import 'package:ehs/animations/slideanimation.dart';
import 'package:ehs/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

final searchquery = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final data = ApiData().fetchCourses();

  //searchbar widget
  Widget searchBar() {
    return TextFormField(
      initialValue: null,
      autocorrect: true,
      controller: searchquery,
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
          borderSide: BorderSide(color: Color(0xff3385e8), width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff8cbaf2), width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        border: InputBorder.none,
        hintText: 'Search your course..',
        hintStyle: TextStyle(
          color: Color(0xff3385e8),
          fontSize: 16.0,
        ),
        suffixIcon: Container(
          decoration: BoxDecoration(
              color: Color(0xff3385e8),
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
                    queryResults: searchquery.text,
                  ),
                ),
              );
            },
            icon: Icon(Icons.search),
            color: Colors.white,
            // disabledColor: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f5),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ehsLogo.png"),
              fit: BoxFit.fitWidth,
              colorFilter: ColorFilter.mode(
                Color(0xfff2f3f5).withOpacity(0.05),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    //slider
                    SliderHome(),

                    //search bar
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 20.0,
                      ),
                      child: searchBar(),
                    ),

                    //category heading
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 6.0),
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
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlideBottomRoute(page: AllCourses()),
                              );
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Color(0xff3385e8),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
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
                    ),
                  ],
                );
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
        ),
      ),
    );
  }
}
