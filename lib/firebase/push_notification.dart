

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  //instance of Firebase Messaging
  final _firebasMesaging = FirebaseMessaging.instance;

  // function to initialize notification
  Future<void> initNotifications() async {
    //request permission from user
    await _firebasMesaging.requestPermission();

    //I could send this during a request,maybe registration or login
    final fcmToken = await _firebasMesaging.getToken();

    print("this is the device: $fcmToken");
  }
}
