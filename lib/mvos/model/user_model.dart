import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/subjects.dart';

typedef Future<void> LoginA({String email, String password});
typedef Future<void> CreateAccountA(
    {String name,
    String surname,
    String email,
    String phone,
    List courseCode});

class UserModel implements Disposable {
  final FirebaseService firebaseService;

  BehaviorSubject<LoggedInO> loggedInO$ = BehaviorSubject<LoggedInO>();
  LoginO loginO;
  AccountO accountO;

  UserModel({
    @required this.firebaseService,
  }) : assert(firebaseService != null,
            'you must initialize the model with firebaseService') {
    _initUserModel();
  }

  Future<void> login({String email, String password}) async {
    firebaseService.loginWithEmailAndPassword(email, password);
  }

  Future<void> createAccount(
      {String name,
      String surname,
      String email,
        String password,
      String phone,
      List courseCode}) async {

    firebaseService.createAccount(
        name, surname, email,password, phone, courseCode);
    return null;
  }

  void _initUserModel() {
    firebaseService.userE$.listen((FirebaseUserE userE) {
      logger.info('user entity received $userE');
      loggedInO$.add(LoggedInO(loggedIn: userE.email != null));
    });

    loginO = LoginO(login: login);
    accountO = AccountO(createAccount: createAccount);
  }

  @override
  Future<void> dispose() {
    loggedInO$.close();
    return null;
  }
}
