import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/views/components/notification_api.dart';
import 'package:bbselearning/views/screens/mainscreen/detailspage.dart';
import 'package:bbselearning/views/screens/mainscreen/noticedetailspage%20.dart';
import 'package:bbselearning/views/screens/processing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuestionPapersController questioncontroller =
      Get.put(QuestionPapersController());

  NotificationApi notificationService = NotificationApi();

  @override
  void initState() {
    super.initState();
    questioncontroller.getLength("accounting");
    questioncontroller.getLength("economics");
    questioncontroller.getLength("management");
    questioncontroller.getLength("compulsory");
  }

  @override
  Widget build(BuildContext context) {
    QuestionPapersController questioncontroller =
        Get.put(QuestionPapersController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/appbarbg.png",
                    alignment: Alignment.topLeft,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            "Hello,",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            "good morning",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          trailing: Container(
                            width: 41,
                            height: 41,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontFamily: "Inter",
                            color: textLightColor,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 31),
                            hintText: "Search",
                            hintStyle: const TextStyle(
                              fontFamily: "Inter",
                              color: textLightColor,
                              fontSize: 15,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF2F2F2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                "Explore categories",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textDarkColor,
                ),
              ),
              trailing: InkWell(
                onTap: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    color: Color(0xff4D8AF0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const BookDetailsScreen(),
                                transition: Transition.rightToLeft,
                                arguments: "Accounting");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/accounting.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Accounting",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.questionACLength} Topics",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const BookDetailsScreen(),
                                transition: Transition.rightToLeft,
                                arguments: "Economics");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/economic.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Economics",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.questionEconomicLength} Topics",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const BookDetailsScreen(),
                                transition: Transition.rightToLeft,
                                arguments: "Management");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/management.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Management",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.questionManageLength} Topics",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const BookDetailsScreen(),
                                transition: Transition.rightToLeft,
                                arguments: "Compulsory");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/bangla.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Compulsory",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.questionBanglaLength} Topics",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const NoticeListScreen(),
                                transition: Transition.rightToLeft);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/noticeboard.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Notice Board",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.noticboardLength} notice",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/blog.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "All Blogs",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.blogsLength} blogs",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/teachers.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Teachers",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Obx(
                                  () => Text(
                                    "${questioncontroller.teachersLength} teachers",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 153,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromARGB(220, 224, 224, 224),
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const ProcessingScreen(),
                                transition: Transition.rightToLeft);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/profile.png",
                                    width: 94,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Dashboard",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: textDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Text(
                                  "for admin",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    color: textLightColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
