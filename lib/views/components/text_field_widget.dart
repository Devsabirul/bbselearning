import 'package:bbselearning/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hinttext;
  final String validateMsg;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    this.isPassword = false,
    required this.hinttext,
    required this.validateMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isValidate = true;
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(
        fontFamily: "Metropolis",
        color: textLightColor,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        errorMaxLines: 1,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontFamily: "Metropolis",
          color: textLightColor,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.only(top: 18, bottom: 18, left: 25),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          isValidate = false;
          return validateMsg;
        }
        return null;
      },
    );
  }
}
