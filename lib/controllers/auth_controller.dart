import 'package:bbselearning/views/screens/dashboard/dashboard_screen.dart';
import 'package:bbselearning/views/screens/mainscreen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLogged_in = false.obs;
  final form_key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearLoginForm() {
    emailController.clear();
    passwordController.clear();
  }

  // login with firebase
  login() async {
    isLoading.value = true;
    await _auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => {
              clearLoginForm(),
              isLoading.value = false,
              Get.snackbar("Authentication", "Login Successfully."),
              Get.off(const DashboardScreen(),
                  transition: Transition.rightToLeft)
            })
        .catchError((e) {
      isLoading.value = false;
      Get.snackbar("Authentication", e!.message);
    });
  }
  // end login

  // save login info

  saveLoginInfo() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogged_in", true);
  }

  getIsLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    var loginValue = prefs.getBool("isLogged_in");
    isLogged_in.value = loginValue ?? false;
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("isLoggedIn");
    clearLoginForm();
    Get.offAll(const HomeScreen(), transition: Transition.rightToLeft);
  }
}
