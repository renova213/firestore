import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_clean_architecture/data/models/contact_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

abstract class ContactRemoteDataSource {
  Future<List<ContactModel>> getContact(String collectionName);
}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  @override
  Future<List<ContactModel>> getContact(String collectionName) async {
    var contact = <ContactModel>[];

    await db.collection(collectionName).get().then((value) {
      for (var element in value.docs) {
        contact.add(
          ContactModel.fromMap(
            element.data(),
          ),
        );
      }
    });
    return contact;
  }
}
