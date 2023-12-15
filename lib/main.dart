import 'package:bbselearning/views/screens/mainscreen/detailspage.dart';
import 'package:bbselearning/views/screens/mainscreen/homepage.dart';
import 'package:bbselearning/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
