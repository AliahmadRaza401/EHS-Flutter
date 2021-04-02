import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Category/categorypage.dart';
import 'package:ehs/animations/slideanimation.dart';
import 'package:flutter/material.dart';

class CourseCategory extends StatefulWidget {
  @override
  _CourseCategoryState createState() => _CourseCategoryState();
}

class _CourseCategoryState extends State<CourseCategory> {
  //Category card
  Widget courseCard(String title, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SlideBottomRoute(
            page: CategoryPage(
              name: title,
              image: image,
            ),
          ),
        );
      },
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
                          maxLines: 2,
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
            courseCard('Arts', 'assets/arts.jpg'),
            courseCard('Business Studies', 'assets/business.jpg'),
            courseCard('World Studies', 'assets/world_study.jpg'),
            courseCard('Classical Studies', 'assets/classical_study.jpg'),
            courseCard('Computer Studies', 'assets/computer_study.jpg'),
            courseCard('Cooperative Education', 'assets/cooperative_study.jpg'),
            courseCard('English', 'assets/english.jpg'),
            courseCard('English as a Second Language', 'assets/english.jpg'),
            courseCard('Native Studies', 'assets/native_studies.jpg'),
            courseCard(
                'French as a Second Language', 'assets/french_courses.jpg'),
            courseCard('Career Education', 'assets/career_education.jpg'),
            courseCard('Health Education', 'assets/health_education.jpg'),
            courseCard('Interdisciplinary Studies',
                'assets/interdisciplinary_studies .jpg'),
            courseCard('Mathematics', 'assets/math.png'),
            courseCard('Native Languages', 'assets/native_languages.jpg'),
            courseCard('Science', 'assets/science.jpg'),
            courseCard(
                'Social Science & Humanities', 'assets/social_science.jpg'),
            courseCard('Technological Education',
                'assets/technological_education.jpg'),
          ],
        ),
      ),
    );
  }
}
