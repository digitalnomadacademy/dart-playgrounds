import 'package:playground_app/mvos/model/entity/saved_credentials.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class SecureStorageService implements Disposable {
  final _storage = FlutterSecureStorage();

  BehaviorSubject<SavedCredentialsE> savedCredsE$ = BehaviorSubject<SavedCredentialsE>();

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> addNewSecureUser(String email,password) async {
    final String passwordKey = 'password';
    final String emailKey = 'email';
    final String passwordValue = password;
    final String emailValue = email;
    savedCredsE$.add(SavedCredentialsE(emailKey,passwordKey));
    await _storage.write(key: passwordKey, value: passwordValue);
    await _storage.write(key: emailKey, value: emailValue);
  }



  @override
  Future<void> dispose() {
    savedCredsE$.close();
    return null;
  }
}
