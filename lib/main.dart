import 'package:bva_parking/customform.dart';
import 'package:bva_parking/welcome.dart';
import 'package:flutter/material.dart';
import 'searchcar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BVA Parking',
      home: Welcome(),
      routes: {
        Welcome.id: (context) => Welcome(),
        CustomForm.id: (context) => CustomForm(),
        SearchPage.id: (context) => SearchPage(),
      },
    );
  }
}
