import 'package:bva_parking/customform.dart';
import 'package:bva_parking/button.dart';
import 'package:flutter/material.dart';
import 'searchcar.dart';

class Welcome extends StatelessWidget {
  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {},
                iconSize: 35,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "BHARAT VANDANA APPTS.",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "PARKING APP",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedGradientButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchPage.id);
                  },
                  child: Text(
                    "SEARCH VEHICLE",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 60,
                  gradient: LinearGradient(
                    colors: [Colors.green[800], Colors.green[500]],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedGradientButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CustomForm.id);
                  },
                  child: Text(
                    "ADD VEHICLE",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 60,
                  gradient: LinearGradient(
                    colors: [Colors.blue[800], Colors.blue[500]],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
