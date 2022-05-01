import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  void registerNotification() async {
    // 1. Initialize the Firebase app
    // await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    FirebaseMessaging _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      _messaging.getToken().then((token) {
        print('###################');
        print(token);
        print('###################');
      });

      _messaging.subscribeToTopic("global");

      // TODO: handle the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
        );
        print(notification.title);

        // Future _firebaseMessagingBackgroundHandler(
        //     RemoteMessage message) async {
        //   print('opened from background');
        // }
        //
        // FirebaseMessaging.onBackgroundMessage(
        //     (message) => _firebaseMessagingBackgroundHandler(message)
        //     );
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }
}

class PushNotification {
  PushNotification({
    required this.title,
    required this.body,
  });

  String title;
  String body;
}
