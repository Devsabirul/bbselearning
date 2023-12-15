import 'dart:async';

import 'package:bbselearning/controllers/auth_controller.dart';
import 'package:bbselearning/views/screens/auth/signin_screen.dart';
import 'package:bbselearning/views/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _authController.getIsLoggedIn();
    Timer(const Duration(seconds: 2), () {
      _authController.isLogged_in.value
          ? Get.off(const DashboardScreen(), transition: Transition.rightToLeft)
          : Get.off(const SignInScreen(), transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
