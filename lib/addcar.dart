import 'package:bva_parking/welcome.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'button.dart';
import 'customTextField.dart';

class AddCar extends StatefulWidget {
  @override
  AddCarState createState() => AddCarState();
}

class AddCarState extends State<AddCar> {
  var ref = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name, phone, email, flatno, vno1, vno2, vno3, vno4;
  @override
  Widget build(BuildContext context) {

    register(
      String _name,
      _phone,
      _email,
      _flatno,
      _vno1,
      _vno2,
      _vno3,
      _vno4,
    ) async {
      if (_name != null &&
          _phone != null &&
          _email != null &&
          _flatno != null &&
          _vno1 != null &&
          _vno2 == null &&
          _vno3 == null &&
          _vno4 == null) {
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno1,
        });
      } else if (_name != null &&
          _phone != null &&
          _email != null &&
          _flatno != null &&
          _vno1 != null &&
          _vno2 != null &&
          _vno3 == null &&
          _vno4 == null) {
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno1,
        });
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno2,
        });
      } else if (name != null &&
          _phone != null &&
          _email != null &&
          _flatno != null &&
          _vno1 != null &&
          _vno2 != null &&
          _vno3 != null &&
          _vno4 == null) {
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno1,
        });
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno2,
        });
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno3,
        });
      } else if (_name != null &&
          _phone != null &&
          _email != null &&
          _flatno != null &&
          _vno1 != null &&
          _vno2 != null &&
          _vno3 != null &&
          _vno4 != null) {
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno1,
        });
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno2,
        });
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno3,
        });
        await ref.collection("vehicles").add({
          'name': _name,
          'phone': _phone,
          'email': _email,
          'flatno': _flatno,
          'vno': _vno4,
        });
      } else {
        Fluttertoast.showToast(
            msg: "FILL COMPLETE FORM",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            CustomTextField(
              icon: Icon(Icons.account_circle),
              hint: "Name",
              validator: (input) {
                if (input.isEmpty) {
                  return '*Required';
                } else {
                  name = input;
                }
              },
            ),
            SizedBox(height: 20),
            NewTextField(
              validator: (input) {
                if (input.isEmpty) {
                  return '*Required';
                } else if (input.length > 3) {
                  return '*Enter valid no.';
                } else {
                  flatno = input;
                }
              },
              hint: "Flat No.",
              icon: Icon(Icons.location_city),
              formatter: [
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              keyboard: TextInputType.number,
              capital: TextCapitalization.none,
            ),
            SizedBox(height: 20),
            NewTextField(
              icon: Icon(Icons.directions_car),
              hint: "Vehicle No. 1",
              validator: (input) {
                if (input.isEmpty) {
                  return '*Required';
                } else if (input.length >= 6 && input.length <= 10) {
                  vno1 = input;
                } else {
                  null;
                }
              },
              capital: TextCapitalization.characters,
            ),
            SizedBox(height: 20),
            NewTextField(
              icon: Icon(Icons.directions_car),
              hint: "Vehicle No. 2",
              validator: (input) {
                if (input.length >= 6 && input.length <= 10) {
                  vno2 = input;
                }
              },
              capital: TextCapitalization.characters,
            ),
            SizedBox(height: 20),
            NewTextField(
              icon: Icon(Icons.directions_car),
              hint: "Vehicle No. 3",
              validator: (input) {
                if (input.length >= 6 && input.length <= 10) {
                  vno3 = input;
                }
              },
              capital: TextCapitalization.characters,
            ),
            SizedBox(height: 20),
            NewTextField(
              icon: Icon(Icons.directions_car),
              hint: "Vehicle No. 4",
              validator: (input) {
                if (input.length >= 6 && input.length <= 10) {
                  vno4 = input;
                }
              },
              capital: TextCapitalization.characters,
            ),
            SizedBox(height: 20),
            NewTextField(
              icon: Icon(Icons.phone_in_talk),
              hint: "Mobile No.",
              validator: (input) {
                if (input.length != 10) {
                  return '*Enter 10 digits';
                } else {
                  phone = input;
                }
              },
              keyboard: TextInputType.number,
              capital: TextCapitalization.none,
            ),
            SizedBox(height: 20),
            CustomTextField(
              icon: Icon(Icons.email),
              hint: "Email",
              validator: (input) {
                if (input.isEmpty) {
                  return '*Required';
                } else if (input.contains('@') && input.contains('.')) {
                  email = input;
                } else {
                  return '*Enter valid email';
                }
              },
            ),
            SizedBox(
              height: 22,
            ),
            RaisedGradientButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  register(name, phone, email, flatno, vno1, vno2, vno3, vno4);
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data...')));
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Data has been saved. Press back.')));
                }
              },
              child: Text(
                "SUBMIT",
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
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
