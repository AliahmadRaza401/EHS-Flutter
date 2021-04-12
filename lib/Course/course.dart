import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Api/apidata.dart';
import 'package:ehs/Localization/language_constants.dart';
import 'package:ehs/Video/video_player.dart';
import 'package:ehs/animations/scaleanimation.dart';
import 'package:ehs/webview/webView.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

final commentText = TextEditingController();
final _formKey = GlobalKey<FormState>();

// ignore: must_be_immutable
class CoursePage extends StatefulWidget {
  String courseName, courseImage;

  CoursePage({this.courseName, this.courseImage});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // ignore: top_level_instance_method
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

  //comment section widget
  Widget commentBar() {
    return TextFormField(
      initialValue: null,
      autocorrect: true,
      controller: commentText,
      validator: (comment) {
        if (comment.isEmpty) {
          return getTranslated(context, 'commentError');
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.text,
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
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff007bff), width: 2.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff8cbaf2), width: 2.0),
        ),
        border: InputBorder.none,
        hintText: getTranslated(context, 'commentHint'),
        hintStyle: TextStyle(
          color: Color(0xff007bff),
          fontSize: 16.0,
        ),
      ),
    );
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
            backgroundColor: Color(0xfff2f2f2).withOpacity(.3),
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
    String courseGrade,
    String coursePreReq,
    String courseDeveloper,
    String courseDevelopDate,
    String courseDepartment,
    String courseStatus,
  ) {
    return Container(
      margin: EdgeInsets.only(top: bodyHeight()),
      padding: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width,
      height: bodyContainerHeight(),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
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
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Text(
                      getTranslated(context, "Details"),
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Grade'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            '$courseGrade',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Prerequisites'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              '$coursePreReq',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Type'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            '$courseType',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Credit_Value'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            '$courseCr',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Developer'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            '$courseDeveloper',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Develop_Date'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            '$courseDevelopDate',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Department'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            '$courseDepartment',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, 'Status'),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            courseStatus == '1'
                                ? getTranslated(context, 'Active')
                                : getTranslated(context, 'Not_Active'),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Description section
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Text(
                      getTranslated(context, "Description"),
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

              //buttons section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                              url:
                                  "https://www.admissionselitehighschool.com/login",
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff007bff),
                        ),
                      ),
                      icon: Icon(
                        Icons.how_to_reg_rounded,
                      ),
                      label: Text(
                        getTranslated(context, "Register"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          ScaleRoute(
                            page: VideoPlayer(
                              videoUrl:
                                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff007bff),
                        ),
                      ),
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 30.0,
                      ),
                      label: Text(
                        getTranslated(context, "Preview"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //post comment section
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Text(
                      getTranslated(context, 'Comment'),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      commentBar(),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  return Text("ok");
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xff007bff),
                                ),
                              ),
                              child: Text(
                                getTranslated(context, 'Post'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //comments section
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      getTranslated(context, 'Comments'),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      " (0)",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: null,
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
                      snapshot.data[i]["grade_id"],
                      snapshot.data[i]["course_description"],
                      snapshot.data[i]["course_developer"],
                      snapshot.data[i]["course_develop_date"],
                      snapshot.data[i]["course_department"],
                      snapshot.data[i]["course_status"],
                    ),
                  ],
                );
              }
            }
          } else if (snapshot.hasError) {
            return Container(
              height: MediaQuery.of(context).size.height,
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
                        getTranslated(context, "No_Internet_Connection!"),
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
