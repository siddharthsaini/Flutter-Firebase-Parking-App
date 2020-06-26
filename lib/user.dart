import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String phone;
  final String email;
  final String flatno;
  final String vno;

  const User({
    this.name,
    this.phone,
    this.email,
    this.flatno,
    this.vno,
  });

  factory User.fromDocument(DocumentSnapshot document) {
    return User(
      name: document['name'],
      phone: document['phone'],
      email: document['email'],
      flatno: document['flatno'],
      vno: document['vno'],
    );
  }
}
