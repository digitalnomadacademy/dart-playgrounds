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
      logger.warning(e);
      throw (e);
    }
    return null;
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    logger.info("Login email and password called");
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = result.user;
      if (!user.isEmailVerified) {
        throw ('Email is not verified');
      }
      return null;
    } catch (e) {
      logger.warning(e);
      throw (e);
    }
  }

  Future<void> createAccount(String name, String surname, String email,
      String password, String phone, String courseCode) async {
    logger.info("Create account called");
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await result.user.sendEmailVerification();
      await database.collection("users").document(result.user.uid).setData({
        "id": result.user.uid,
        "name": name,
        "surname": surname,
        "phone": phone,
        "coursecode": [courseCode],
      });
      return null;
    } catch (e) {
      logger.warning(e);
      throw (e);
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
      if (firebaseUser != null) {
        if (firebaseUser.email != null && firebaseUser.email != '') {
          DocumentSnapshot userDocument = await Firestore.instance
              .collection(Collections.users)
              .document(firebaseUser.uid)
              .get();
          userE$.add(FirebaseUserE(
            uid: firebaseUser?.uid,
            email: firebaseUser?.email,
            phone: userDocument?.data['phone'] ?? null,
            name: userDocument?.data['name'] ?? null,
            surname: userDocument?.data['surname'] ?? null,
            courseCode: userDocument?.data['courseCode'] ?? null,
          ));
        } else {
          userE$.add(FirebaseUserE(uid: firebaseUser.uid));
        }
      }
    });
  }
}

class Collections {
  static const users = 'users';
}
