import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService implements Disposable {
  final database = Firestore.instance;

  PublishSubject<FirebaseUserE> userE$ = PublishSubject<FirebaseUserE>();

  FirebaseService() {
    _initFirebase();
  }

  Future<void> signInAnonymously() async {
    logger.info('Login anonymously called');
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      throw ('sign in anonymously failed');
    }
    return null;
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    logger.info("Login email and password called");
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      throw ("login error");
    }
  }

  Future<void> createAccount(String name, String surname, String email,
      String password, String phone, List courseCode) async {
    logger.info("Create account called");
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await database.collection("users").add({
        "name": name,
        "surname": surname,
        "phone": phone,
        "coursecode": courseCode,
      });
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      user.updateProfile(UserUpdateInfo());
      return null;
    } catch (e) {
      print(e.toString());
      throw ("error:$e");
    }
  }

  @override
  Future<void> dispose() {
    userE$.close();
    return null;
  }

  void _initFirebase() async {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) async {
      logger.info('auth state changed $firebaseUser');
      var userDocument = await Firestore.instance
          .collection(Collections.users)
          .document(firebaseUser.uid)
          .get();
      userE$.add(FirebaseUserE(
        uid: firebaseUser?.uid,
        email: firebaseUser?.email,
        phone: userDocument['phone'],
        name: userDocument['name'],
        surname: userDocument['surname'],
        courseCode: userDocument['courseCode'],
      ));
    });
  }
}

class Collections {
  static const users = 'users';
}
