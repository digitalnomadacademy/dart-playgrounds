import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/subjects.dart';

typedef Future<void> Login({String email, String password});
typedef Future<void> CreateAccount(
    {String name,
    String surname,
    String email,
    String phone,
    String courseCode,
    String password});

class UserModel implements Disposable {
  final FirebaseService firebaseService;

  BehaviorSubject<LoggedInO> loggedInO$ = BehaviorSubject<LoggedInO>();
  BehaviorSubject<UserO> userO$ = BehaviorSubject<UserO>();
  LoginA loginA;
  CreateAccountA createAccountA;
  UserO userO;

  UserModel({
    @required this.firebaseService,
  }) : assert(firebaseService != null,
            'you must initialize the model with firebaseService') {
    _initUserModel();
  }

  Future<void> login({String email, String password}) {
    return firebaseService.loginWithEmailAndPassword(email, password);
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
      if (userE.name != null) {
        userO$.add(UserO(user: userE.name));
      }
    });

    loginA = LoginA(login: login);
    createAccountA = CreateAccountA(createAccount: createAccount);
  }

  @override
  Future<void> dispose() {
    loggedInO$.close();
    userO$.close();
    return null;
  }
}
