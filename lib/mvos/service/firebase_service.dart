import 'package:firebase_auth/firebase_auth.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService implements Disposable {
  PublishSubject<FirebaseUserE> userE$ = PublishSubject<FirebaseUserE>()..add(FirebaseUserE(uid: null));

  FirebaseService() {
    _initFirebase();
  }

  Future<void> signInAnonymously() async {
    logger.info('Login anonymously called');
    FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> loginWithEmailAndPassword() async {
    logger.info("Login email and password called");
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "goranesine@gmail.com", password: "Testpassword01");
  }

  @override
  Future<void> dispose() {
    userE$.close();
    return null;
  }

  void _initFirebase() async {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
      logger.info('auth state changed $firebaseUser');
      userE$.add(FirebaseUserE(uid: firebaseUser?.uid));
    });
  }
}
