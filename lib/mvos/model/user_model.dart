import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:playground_app/shared/interfaces.dart';

class UserModel implements Disposable {
  final FirebaseService firebaseService;

  StreamController<LoggedInO> _loggedInO$ = StreamController.broadcast();
  Stream<LoggedInO> get loggedInO$ => _loggedInO$.stream;
  UserModel({
    @required this.firebaseService,
  }) : assert(firebaseService != null,
            'you must initialize the model with firebaseService') {
    _initUserModel();
  }

  @override
  Future<void> dispose() {
    _loggedInO$.close();
    return null;
  }

  void _initUserModel() {
    firebaseService.userE$.listen((UserE userE) {
      logger.info('user entity received $userE');
      _loggedInO$.add(LoggedInO(loggedIn: userE.uid != null));
    });
  }
}
