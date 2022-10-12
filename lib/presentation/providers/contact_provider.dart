import 'package:firestore_clean_architecture/domain/entities/contact.dart';
import 'package:firestore_clean_architecture/domain/usecases/get_contact.dart';
import 'package:flutter/cupertino.dart';

import '../../core/error/failure.dart';
import '../../core/utils/finite_state.dart';

class ContactProvider extends ChangeNotifier {
  final GetContact getContact;
  ContactProvider({required this.getContact});

  late List<Contact> _contacts;
  List<Contact> get contacts => _contacts;

  late MyState _myState;
  MyState get myState => _myState;

  void getContac(String collectionName) async {
    try {
      _myState = MyState.loading;
      notifyListeners();
      final result = await getContact(collectionName);

      result.fold((failure) => _mapFailureOrMessage(failure),
          (contact) => _contacts = contact);

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.hasNoData;
      e.toString();
      notifyListeners();
    }
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}
