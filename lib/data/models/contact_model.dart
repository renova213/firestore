import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_clean_architecture/domain/entities/contact.dart';

class ContactModel extends Contact {
  const ContactModel({required super.name, required super.phone});

  factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        name: json['name'],
        phone: json['phone'],
      );

  factory ContactModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    var contactModel = ContactModel.fromMap(
      json.decode(
        documentSnapshot.data() as String,
      ),
    );
    return contactModel;
  }
}
