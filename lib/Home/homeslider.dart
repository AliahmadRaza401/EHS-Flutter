import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHome extends StatefulWidget {

  //slider card
  @override
  _SliderHomeState createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  //responsive
  dynamic height() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .26;
    } else {
      return MediaQuery.of(context).size.height * .6;
    }
  }

  //slider container
  Widget sliderContainer(String image) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: height(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        sliderContainer('assets/slider1.jpg'),
        sliderContainer('assets/slider2.jpg'),
        sliderContainer('assets/slider3.jpg'),
      ],
      options: CarouselOptions(
        height: height(),
        enlargeCenterPage: true,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        autoPlayAnimationDuration: Duration(seconds: 2),
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
