import 'dart:convert' as convert;

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiData {
  fetchCourses() async {
    var url = Uri.https('admissionselitehighschool.com', '/api/v1/courses');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['data'];
      // print(apiData);
    }
  }
}

// class ApiData extends StatefulWidget {
//   @override
//   _ApiDataState createState() => _ApiDataState();
// }

// class _ApiDataState extends State<ApiData> {
//   fetchCourses() async {
//     var url = Uri.https('admissionselitehighschool.com', '/api/v1/courses');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       return jsonResponse['data'];
//       // print(apiData);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return fetchCourses();
//   }
// }
