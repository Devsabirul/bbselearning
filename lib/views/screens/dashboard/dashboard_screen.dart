import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/auth_controller.dart';
import 'package:bbselearning/views/screens/dashboard/addinfo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final AuthController _authController = Get.put(AuthController());

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _authController.saveLoginInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        toolbarHeight: 60,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWZM4LaEBG5h5ux83IEllVR4Y1vRwsWtLdA&usqp=CAU'),
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(20),
                        // bottomRight: Radius.circular(20),
                        ),
                  ),
                ),
                Image.asset(
                  "assets/images/appbarbg.png",
                  alignment: Alignment.topLeft,
                ),

                // SizedBox(
                //   width: Get.width,
                //   height: 180,
                //   child: const Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 20),
                //     child: Center(
                //       child: ListTile(
                //         leading: CircleAvatar(
                //           backgroundImage: NetworkImage(
                //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWZM4LaEBG5h5ux83IEllVR4Y1vRwsWtLdA&usqp=CAU'),
                //           maxRadius: 35,
                //           backgroundColor: Colors.grey,
                //         ),
                //         title: Text(
                //           "Hi Admin.",
                //           style: TextStyle(
                //             fontFamily: "Inter",
                //             color: Colors.white,
                //             fontWeight: FontWeight.w500,
                //             fontSize: 20,
                //           ),
                //         ),
                //         subtitle: Text(
                //           "BBS group controller",
                //           style: TextStyle(
                //             fontFamily: "Inter",
                //             color: Color.fromARGB(255, 214, 214, 214),
                //             fontSize: 15,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: Get.width * 0.485,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "85",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Total Blogs",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.485,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "70",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Total Notice",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.485,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "10",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Total Teachers",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.485,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "50",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Total Topics",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Add Information:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: textLightColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(const AddInformationScreen(),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.add_circle_outlined,
                                        color: textLightColor,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Add Info",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: textLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.add_circle_outlined,
                                        color: textLightColor,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Add Blog",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: textLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.add_circle_outlined,
                                        color: textLightColor,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Notices",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: textLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.add_circle_outlined,
                                        color: textLightColor,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Teachers",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: textLightColor,
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
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "Information:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: textLightColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading:
                                Image.asset("assets/images/accounting.png"),
                            title: const Text(
                              "Accounting",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text("Get all Accounting Table"),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset("assets/images/economic.png"),
                            title: const Text(
                              "Economics",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text("Get all Economics Table"),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading:
                                Image.asset("assets/images/management.png"),
                            title: const Text(
                              "Management",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text("Get all Management Table"),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset("assets/images/bangla.png"),
                            title: const Text(
                              "Compulsory",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text("Get all Compulsory Table"),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset("assets/images/blog.png"),
                            title: const Text(
                              "All Tables",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text("Get all Others Tables"),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
