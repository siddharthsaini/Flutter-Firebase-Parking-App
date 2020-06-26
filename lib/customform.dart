import 'package:flutter/material.dart';
import 'addcar.dart';

class CustomForm extends StatelessWidget {
  static const id = 'customform';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
          title: Text(
            "ADD VEHICLE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AddCar(),
        ),
      ),
    );
  }
}
