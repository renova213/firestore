import 'package:dartz/dartz.dart';
import 'package:firestore_clean_architecture/core/error/failure.dart';
import 'package:firestore_clean_architecture/domain/entities/contact.dart';
import 'package:firestore_clean_architecture/domain/repositories/contact_repository.dart';

class GetContact {
  final ContactRepository repostory;

  GetContact({required this.repostory});

  Future<Either<Failure, List<Contact>>> call(String collectionName) async {
    var contact = await repostory.getContact(collectionName);
    return contact;
  }
}
