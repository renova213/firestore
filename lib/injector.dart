import 'package:firestore_clean_architecture/data/datasources/contact_remote_data_source.dart';
import 'package:firestore_clean_architecture/data/repositories/contact_repository_impl.dart';
import 'package:firestore_clean_architecture/domain/repositories/contact_repository.dart';
import 'package:firestore_clean_architecture/domain/usecases/get_contact.dart';
import 'package:firestore_clean_architecture/presentation/providers/contact_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<ContactRemoteDataSource>(
    () => ContactRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<ContactRepository>(
      () => ContactRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<GetContact>(
    () => GetContact(
      repostory: sl(),
    ),
  );

  sl.registerLazySingleton<ContactProvider>(
    () => ContactProvider(
      getContact: sl(),
    ),
  );
}
