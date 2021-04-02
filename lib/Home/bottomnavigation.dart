import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ehs/Support%20Pages/support.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Container(
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 52.0,
        backgroundColor: Colors.transparent,
        index: 0,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.home_rounded,
            size: 30,
            color: Color(0xff007bff),
          ),
          Icon(
            Icons.support_agent_rounded,
            size: 30,
            color: Color(0xff007bff),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Home();
      case 1:
        return Support();
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Tabbar Index Error"),
          ],
        );
    }
  }
}
