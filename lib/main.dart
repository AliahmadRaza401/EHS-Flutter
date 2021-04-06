import 'package:ehs/Home/bottomnavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EHS',
      theme: ThemeData(
        primaryColor: Color(0xff007bff),
      ),
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic photoSize() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * .7;
    } else {
      return MediaQuery.of(context).size.width * .3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SplashScreen(
        seconds: 3,
        backgroundColor: Color(0xfff2f2f2),
        navigateAfterSeconds: BottomNav(),
        image: new Image.asset(
          'assets/ehsLogo.png',
        ),
        photoSize: photoSize(),
        useLoader: false,
      ),
    );
  }
}
