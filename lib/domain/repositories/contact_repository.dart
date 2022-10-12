import 'package:dartz/dartz.dart';
import 'package:firestore_clean_architecture/core/error/failure.dart';
import 'package:firestore_clean_architecture/domain/entities/contact.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<Contact>>> getContact(String collectionName);
}
