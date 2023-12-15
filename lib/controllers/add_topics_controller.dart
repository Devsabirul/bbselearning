import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTopicController extends GetxController {
  TextEditingController title = TextEditingController();
  final form_key = GlobalKey<FormState>();

  List<String> category =
      ['Accounting', 'Economics', 'Management', 'Compulsory'].obs;
  RxString selectedCategory = "Accounting".obs;
  RxString date = "".obs;

  List<File> _images = [];


  
}
