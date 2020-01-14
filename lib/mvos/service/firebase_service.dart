import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService implements Disposable {
  final database = Firestore.instance;

  PublishSubject<FirebaseUserE> userE$ = PublishSubject<FirebaseUserE>()
    ..add(FirebaseUserE(uid: null, email: null));

  FirebaseService() {
    _initFirebase();
  }

  Future<void> signInAnonymously() async {
    logger.info('Login anonymously called');
    FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    logger.info("Login email and password called");
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createAccount(String name, String surname, String email,
      String password, String phone, String courseCode) async {
    logger.info("Create account called");
    await database.collection("users").add({
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "phone": phone,
      "coursecode": courseCode,
    });
  }

  @override
  Future<void> dispose() {
    userE$.close();
    return null;
  }

  void _initFirebase() async {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
      logger.info('auth state changed $firebaseUser');
      userE$.add(
          FirebaseUserE(uid: firebaseUser?.uid, email: firebaseUser?.email));
    });
  }
}
