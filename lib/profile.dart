import 'package:flutter/material.dart';
import 'button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(this.name, this.phone, this.email, this.flatno, this.vno);
  final String name, phone, email, flatno, vno;

  void customLauncher(command)async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          "Vehicle Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DetailCard(
                icon: Icon(Icons.person),
                preData: 'Name',
                data: name,
              ),
              DetailCard(
                icon: Icon(Icons.location_city),
                preData: 'Flat No.',
                data: flatno,
              ),
              DetailCard(
                icon: Icon(Icons.directions_car),
                preData: 'Vehicle No.',
                data: vno,
              ),
              DetailCard(
                icon: Icon(Icons.phone_in_talk),
                preData: 'Mobile No.',
                data: phone,
              ),
              DetailCard(
                icon: Icon(Icons.email),
                preData: 'Email',
                data: email,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 26, right: 26),
                child: RaisedGradientButton(
                  onPressed: () => customLauncher('tel:+91 $phone'),
                  child: Text(
                    "CALL",
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 26, right: 26),
                child: RaisedGradientButton(
                  onPressed: () => customLauncher('mailto:$email'),
                  child: Text(
                    "EMAIL",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 60,
                  gradient: LinearGradient(
                    colors: [Colors.red[800], Colors.red[500]],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  DetailCard({this.data, this.preData, this.icon});
  final String data;
  final String preData;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 18, right: 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[],
        ),
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 15.0,
                    ),
                    alignment: FractionalOffset.centerLeft,
                    child: icon,
                  ),
                  Text(
                    preData,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    data,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

