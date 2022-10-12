import 'package:dartz/dartz.dart';
import 'package:firestore_clean_architecture/core/error/exception.dart';
import 'package:firestore_clean_architecture/core/error/failure.dart';
import 'package:firestore_clean_architecture/data/datasources/contact_remote_data_source.dart';
import 'package:firestore_clean_architecture/domain/entities/contact.dart';
import 'package:firestore_clean_architecture/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;
  ContactRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Contact>>> getContact(
      String collectionName) async {
    try {
      final contact = await remoteDataSource.getContact(collectionName);

      return Right(contact);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }
}
