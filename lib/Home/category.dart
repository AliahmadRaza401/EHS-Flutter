import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Category/categorypage.dart';
import 'package:ehs/Localization/language_constants.dart';
import 'package:flutter/material.dart';

class CourseCategory extends StatefulWidget {
  @override
  _CourseCategoryState createState() => _CourseCategoryState();
}

class _CourseCategoryState extends State<CourseCategory> {
  //Category card
  Widget courseCard(String title, String image) {
    return OpenContainer(
        transitionDuration: Duration(milliseconds: 600),
        closedColor: Colors.transparent,
        closedElevation: 0.0,
        closedBuilder: (context, openWidget) {
          return GestureDetector(
            onTap: openWidget,
            child: SizedBox(
              width: 116,
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          image,
                          fit: BoxFit.fill,
                          height: 74.0,
                          width: 100.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 42.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: AutoSizeText(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(8.0),
              ),
            ),
          );
        },
        openBuilder: (context, closeWidget) {
          return CategoryPage(
            name: title,
            image: image,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132.0,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            courseCard(getTranslated(context, 'Arts'), 'assets/arts.jpg'),
            courseCard(getTranslated(context, 'Business_Studies'),
                'assets/business.jpg'),
            courseCard(getTranslated(context, 'World_Studies'),
                'assets/world_study.jpg'),
            courseCard(getTranslated(context, 'Classical_Studies'),
                'assets/classical_study.jpg'),
            courseCard(getTranslated(context, 'Computer_Studies'),
                'assets/computer_study.jpg'),
            courseCard(getTranslated(context, 'Cooperative_Education'),
                'assets/cooperative_study.jpg'),
            courseCard(getTranslated(context, 'English'), 'assets/english.jpg'),
            courseCard(getTranslated(context, 'English_as_a_Second_Language'),
                'assets/english.jpg'),
            courseCard(getTranslated(context, 'Native_Studies'),
                'assets/native_studies.jpg'),
            courseCard(getTranslated(context, 'French_as_a_Second_Language'),
                'assets/french_courses.jpg'),
            courseCard(getTranslated(context, 'Career_Education'),
                'assets/career_education.jpg'),
            courseCard(getTranslated(context, 'Health_Education'),
                'assets/health_education.jpg'),
            courseCard(getTranslated(context, 'Interdisciplinary_Studies'),
                'assets/interdisciplinary_studies .jpg'),
            courseCard(
                getTranslated(context, 'Mathematics'), 'assets/math.png'),
            courseCard(getTranslated(context, 'Native_Languages'),
                'assets/native_languages.jpg'),
            courseCard(getTranslated(context, 'Science'), 'assets/science.jpg'),
            courseCard(getTranslated(context, 'Social_Science_Humanities'),
                'assets/social_science.jpg'),
            courseCard(getTranslated(context, 'Technological_Education'),
                'assets/technological_education.jpg'),
          ],
        ),
      ),
    );
  }
}
