import 'package:firebase_auth/firebase_auth.dart';
import 'package:playground_app/logger/logger.dart';
import 'package:playground_app/mvos/model/entity/user_entity.dart';
import 'package:playground_app/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService implements Disposable {
//  PROPERTIES
  PublishSubject<UserE> userE$ = PublishSubject<UserE>()..add(UserE(uid: null));

//  CONSTRUCTOR
  FirebaseService() {
    _initFirebase();
  }

//  PUBLIC METHODS
  Future<void> loginAnonymously() async {
    logger.info('Login anonymously called');
    FirebaseAuth.instance.signInAnonymously();
  }
// ONLY FOR TEST LOGIN
  Future<void> loginWithEmailAndPassword()async{
    logger.info("Login email and password called");
    FirebaseAuth.instance.signInWithEmailAndPassword(email: "goranesine@gmail.com", password: "Testpassword01");
  }


  @override
  Future<void> dispose() {
    userE$.close();
    return null;
  }

//  PRIVATE METHODS
  void _initFirebase() async {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
      logger.info('auth state changed $firebaseUser');
      userE$.add(UserE(uid: firebaseUser?.uid));
    });
    //todo @goran new issue / user document from firestore
  }
}
