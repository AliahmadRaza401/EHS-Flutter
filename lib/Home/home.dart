import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Course/allcourses.dart';
import 'package:ehs/Home/category.dart';
import 'package:ehs/Home/homeslider.dart';
import 'package:ehs/Home/topcourse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //searchbar widget
  Widget searchBar() {
    return TextFormField(
      initialValue: null,
      autocorrect: true,
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
        contentPadding: EdgeInsets.symmetric(
          vertical: 2.0,
        ),
        errorStyle: TextStyle(
          fontSize: 15.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3385e8), width: 2.0),
          borderRadius: BorderRadius.circular(14.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff8cbaf2), width: 2.0),
          borderRadius: BorderRadius.circular(14.0),
        ),
        border: InputBorder.none,
        hintText: 'Search your course..',
        hintStyle: TextStyle(
          color: Color(0xff3385e8),
          fontSize: 16.0,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Color(0xff3385e8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f5),
      body: SingleChildScrollView(
        child: Column(
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
                        MaterialPageRoute(
                          builder: (BuildContext context) => AllCourses(),
                        ),
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
                    title: "hi",
                    image: "assets/sliderimage.jpg",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                    ),
                    child: TopCourses(
                      title: "2",
                      image: "assets/sliderimage.jpg",
                    ),
                  ),
                  TopCourses(
                    title: "hi",
                    image: "assets/sliderimage.jpg",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                    ),
                    child: TopCourses(
                      title: "hi",
                      image: "assets/sliderimage.jpg",
                    ),
                  ),
                  TopCourses(
                    title: "hi",
                    image: "assets/sliderimage.jpg",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                    ),
                    child: TopCourses(
                      title: "hi",
                      image: "assets/sliderimage.jpg",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
