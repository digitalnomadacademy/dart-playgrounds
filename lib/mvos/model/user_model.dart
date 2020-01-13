import 'dart:async';

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
    String password,
    String phone,
    String courseCode});

class UserModel implements Disposable {
  final FirebaseService firebaseService;

  BehaviorSubject<LoggedInO> loggedInO$ = BehaviorSubject<LoggedInO>();
  LoginO loginO;
  UserModel({
    @required this.firebaseService,
  }) : assert(firebaseService != null,
            'you must initialize the model with firebaseService') {
    _initUserModel();
  }

  Future<void> login({String email, String password}) async {
//    todo implement
  }

  void _initUserModel() {
    firebaseService.userE$.listen((FirebaseUserE userE) {
      logger.info('user entity received $userE');
      loggedInO$.add(LoggedInO(loggedIn: userE.email != null));
    });

    loginO = LoginO(login: login);
  }

  @override
  Future<void> dispose() {
    loggedInO$.close();
    return null;
  }
}
