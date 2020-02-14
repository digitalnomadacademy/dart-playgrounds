import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:playground_app/shared/interfaces.dart';

class FirebasePushNotificationService implements Disposable {
  final FirebaseMessaging service;

  FirebasePushNotificationService() : service = FirebaseMessaging() {
    _init();
  }

  @override
  Future<void> dispose() {
    return service.deleteInstanceID();
  }

  void _init() {
    service.configure(onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
    });
  }
}
