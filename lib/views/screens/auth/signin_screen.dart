import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/auth_controller.dart';
import 'package:bbselearning/views/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  final AuthController _authController = Get.put(AuthController());
  void dispose() {
    _authController.clearLoginForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                const Text(
                  "Log in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: textDarkColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "hey admin,welcome back!",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: textLightColor,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Form(
                  key: _authController.form_key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormFieldWidget(
                        hinttext: "Your Email",
                        controller: _authController.emailController,
                        validateMsg: '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldWidget(
                        hinttext: "Password",
                        controller: _authController.passwordController,
                        isPassword: true,
                        validateMsg: '',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forget Password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: textLightColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_authController.form_key.currentState!.validate()) {
                      _authController.login();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: Size(Get.width, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Obx(
                    () => _authController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text(
                  "By logging in, you agree to our",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: textLightColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Wrap(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Terms & Condition ",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 113, 222, 117),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      "&",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        color: textLightColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        " Privacy & Policy",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 113, 222, 117),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
