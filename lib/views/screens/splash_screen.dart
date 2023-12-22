import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/auth_controller.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/views/screens/mainscreen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  QuestionPapersController questioncontroller =
      Get.put(QuestionPapersController());
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _authController.getIsLoggedIn();
    questioncontroller.getLength("accounting");
    questioncontroller.getLength("economics");
    questioncontroller.getLength("management");
    questioncontroller.getLength("compulsory");
    questioncontroller.topicsLength();
    questioncontroller.noticeBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/splash.png",
                  fit: BoxFit.cover,
                  width: 375.w,
                  height: 442.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Welcome To \n Learner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: textDarkColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: Wrap(
                    children: [
                      Text(
                        "My BBS Friend, the app designed for the previous exam question papers, my all friends are KHSFRASRS welcome again.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: textLightColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(const HomeScreen(),
                          transition: Transition.rightToLeft);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(335, 54),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
