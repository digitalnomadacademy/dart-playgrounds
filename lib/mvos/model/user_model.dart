import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:playground_app/mvos/service/secure_storage_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_logger/simple_logger.dart';

typedef Future<void> Login({String email, String password, bool rememberMe});
typedef Future<void> LogOut();
typedef Future<void> CreateAccount(
    {String name,
    String surname,
    String email,
    String phone,
    String courseCode,
    String password});

class UserModel implements Disposable {
  final UserService firebaseService;
  final SecureStorageService secureStorageService;

  BehaviorSubject<LoggedInO> loggedInO$ = BehaviorSubject<LoggedInO>();
  BehaviorSubject<UserO> userO$ = BehaviorSubject<UserO>();
  BehaviorSubject<SavedUserO> savedUserO$ = BehaviorSubject<SavedUserO>();
  BehaviorSubject<IsAdminO> isAdminO$ = BehaviorSubject<IsAdminO>();
  LoginA loginA;
  CreateAccountA createAccountA;
  LogOutA logOutA;
  UserO userO;

  UserModel({
    @required this.firebaseService,
    @required this.secureStorageService,
  }) : assert(firebaseService != null,
            'you must initialize the model with firebaseService') {
    _initUserModel();
  }

  Future<void> login({String email, String password, bool rememberMe}) {
    if (rememberMe) {
      secureStorageService.addNewSecureUser(email, password);
      secureStorageService.savedCredsE$.listen((value) {
        savedUserO$
            .add(SavedUserO(emailKey: value.emailKey, passwordKey: value.passwordKey));
      });
    }

    return firebaseService.loginWithEmailAndPassword(email, password);
  }

  Future<void> logOut() async {
    secureStorageService.deleteAll();
    savedUserO$
        .add(null);
    return firebaseService.logOut();
  }

  Future<void> createAccount(
      {String name,
      String surname,
      String email,
      String password,
      String phone,
      String courseCode}) async {
    return firebaseService.createAccount(
        name, surname, email, password, phone, courseCode);
  }

  void _initUserModel() {
    firebaseService.userE$.listen((FirebaseUserE userE) {
      logger.info('user entity received $userE');
      bool isLoggedIn = userE.email != null;
      loggedInO$.add(LoggedInO(loggedIn: isLoggedIn));
      isAdminO$.add(IsAdminO(isAdmin: userE.isAdmin ?? false));
      if (userE.name != null) {
        userO$.add(UserO(user: userE.name, email: userE.email));
      }
    });

    loginA = LoginA(login: login);
    createAccountA = CreateAccountA(createAccount: createAccount);
    logOutA = LogOutA(logOut: logOut);
  }

  @override
  Future<void> dispose() {
    loggedInO$.close();
    userO$.close();
    savedUserO$.close();
    isAdminO$.close();
    return null;
  }
}
