import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/Profile.dart';
import 'package:scheduleapp/msgPage.dart';
import 'package:scheduleapp/scTable.dart';
import 'HomePage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(const Schedule());
}

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Scheduleapp createState() => Scheduleapp();
}

class Scheduleapp extends State<Schedule> {
  int _selectedItemIndex = 0;
  final List pages = [
    const HomePage(),
    const scTable(),
    const msgPage(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    @override
    initState() {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null && !kIsWeb) {
          flutterLocalNotificationsPlugin!.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel!.id,
                  channel!.name,
                  channel!.description,
                  // TODO add a proper drawable resource to android, for now using
                  //      one that already exists in example app.
                  icon: 'launch_background',
                ),
              ));
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('Notification clicked');
        // Navigator.pushNamed(context, '/message',
        //     arguments: MessageArguments(message, true));
      });
      super.initState();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   elevation: 0,
        //   backgroundColor: const Color(0xFFF9F9FB),
        //   unselectedItemColor: Colors.grey,
        //   selectedItemColor: Colors.black,
        //   selectedIconTheme: IconThemeData(
        //     color: Colors.blueGrey[600],
        //   ),
        //   currentIndex: _selectedItemIndex,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: (int index) {
        //     setState(() {
        //       _selectedItemIndex = index;
        //     });
        //   },
        //   items: const [
        //     BottomNavigationBarItem(
        //       label: "",
        //       icon: Icon(Icons.home),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "",
        //       icon: Icon(Icons.table_chart_outlined),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "",
        //       icon: Icon(Icons.message_outlined),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "",
        //       icon: Icon(Icons.account_circle_outlined),
        //     ),
        //   ],
        // ),
        body: pages[_selectedItemIndex],
      ),
    );
  }
}
