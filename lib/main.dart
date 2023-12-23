import 'dart:convert';
import 'package:bbselearning/views/screens/mainscreen/detailspage.dart';
import 'package:bbselearning/views/screens/mainscreen/homepage.dart';
import 'package:bbselearning/views/screens/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  OneSignal.initialize("601a9891-f077-4f69-8bcd-daa1c3834b33");
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            routes: {
              "/": (context) => const SplashScreen(),
              "/homescreen": (context) => const HomeScreen(),
              "/details": (context) => const BookDetailsScreen(),
            },
          );
        });
  }
}
