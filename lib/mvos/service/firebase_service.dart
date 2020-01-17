import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService implements Disposable {
  final database = Firestore.instance;

  PublishSubject<FirebaseUserE> userE$ = PublishSubject<FirebaseUserE>()
    ..add(FirebaseUserE(
        name: null,
        surname: null,
        email: null,
        phone: null,
        courseCode: null,
        uid: null));

  FirebaseService() {
    _initFirebase();
  }

  Future<String> signInAnonymously() async {
    logger.info('Login anonymously called');
   AuthResult result = await FirebaseAuth.instance.signInAnonymously();
   return result.user.uid;
  }

  Future<String> loginWithEmailAndPassword(String email, String password) async {
    logger.info("Login email and password called");
    try {
    AuthResult result =  await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    return result.user.email;
    } catch (e) {
      throw ("");
    }

  }

  Future<String> createAccount(String name, String surname, String email,
      String password, String phone, List courseCode) async {
    logger.info("Create account called");
    try {
   AuthResult result =   await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await database.collection("users").add({
        "name": name,
        "surname": surname,
        "email": email,
        "phone": phone,
        "coursecode": courseCode,
      });
      return result.user.email;
    } catch (e) {
      throw ("");
    }
  }

  @override
  Future<void> dispose() {
    userE$.close();
    return null;
  }

  void _initFirebase() async {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
      logger.info('auth state changed $firebaseUser');
      userE$.add(FirebaseUserE(
        uid: firebaseUser?.uid,
        email: firebaseUser?.email,
      ));
    });
  }
}
