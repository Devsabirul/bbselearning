import 'dart:io';
import 'package:bbselearning/models/questionpapers_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddTopicController extends GetxController {
  TextEditingController title = TextEditingController();
  final form_key = GlobalKey<FormState>();

  List<String> category =
      ['Accounting', 'Economics', 'Management', 'Compulsory'].obs;
  RxString selectedCategory = "Accounting".obs;
  RxString date = "".obs;
  RxBool isLoading = false.obs;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<XFile> _images = [];
  File? imagePath;
  RxString imgpath = "".obs;

  Future<void> getImage() async {
    // Clear all items from the list
    _images.clear();

    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      for (var image in images) {
        _images.add(image);
      }
    } else {
      print("No images selected");
    }
  }

  clearForm() {
    title.clear();
    date.value = "";
    selectedCategory.value = "Accounting";
    imgpath.value = "";
  }

  addTopic() async {
    isLoading.value = true;

    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('questionpapers');

      List<String> imageUrls =
          []; // To store download URLs of all uploaded images

      for (var imageFile in _images) {
        final firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref(
                '/topicsimage/${DateTime.now()}_${_images.indexOf(imageFile)}.jpg');

        UploadTask uploadTask = ref.putFile(File(imageFile.path));
        await uploadTask;
        var imageUrl = await ref.getDownloadURL();

        imageUrls.add(imageUrl); // Collecting the download URLs

        // You may add some delay here if needed
        // await Future.delayed(Duration(seconds: 1));
      }

      final user = _auth.currentUser;

      QuestionPapersModel newData = QuestionPapersModel(
        title: title.text,
        category: selectedCategory.value.toLowerCase(),
        date: date.value.toString(),
        image: imageUrls, // Assigning the list of download URLs
        user: user?.uid.toString(),
      );

      // Convert the data model to a map
      Map<dynamic, dynamic> data = newData.toJson();

      // Add the data to Firestore
      await collectionReference.add(data);

      clearForm();
      isLoading.value = false;
      Get.snackbar("Success", "Data added successfully");
    } catch (e) {
      isLoading.value = false;
    }
  }
}
