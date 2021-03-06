import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehs/Localization/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  // header image widget
  Widget headerImage() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/support.png',
          ),
          fit: BoxFit.fill,
        ),
        color: Color(0xff007bff),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: null,
    );
  }

  //card
  Widget supportCards() {
    return Container(
      margin: EdgeInsets.only(
        top: 50.0,
        bottom: 30.0,
      ),
      width: MediaQuery.of(context).size.width * .9,
      child: Container(
        height: 90.0,
        padding: EdgeInsets.all(10.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: ListTile(
              leading: Icon(
                Icons.chat_outlined,
                color: Color(0xff007bff),
                size: 44.0,
              ),
              title: Text(
                getTranslated(context, 'Contact_Live_Chat'),
                style: TextStyle(
                  color: Color(0xff007bff),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.navigate_next_rounded,
                color: Color(0xff007bff),
                size: 44.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        title: AutoSizeText(
          getTranslated(context, 'Reach_Our_Support_Team'),
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff2f2f2),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerImage(),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                getTranslated(context, 'How_Can_We_Help_You'),
                style: TextStyle(
                  color: Color(0xff007bff),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            supportCards(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 54.0,
                  height: 54.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    Icons.email_outlined,
                    size: 34.0,
                    color: Color(0xff007bff),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getTranslated(context, 'Send_us_an_email'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 6.0,
                bottom: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "info@elitehighschool.com",
                    style: TextStyle(
                      color: Color(0xff007bff),
                      fontSize: 18.0,
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
