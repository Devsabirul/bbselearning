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

  List<File> _images = [];
  File? imagePath;
  RxString imgpath = "".obs;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = File(image.path);
      imgpath.value = imagePath.toString();
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
      final firebase_storage.Reference ref = firebase_storage
          .FirebaseStorage.instance
          .ref('/topicsimage/${DateTime.now()}.jpg');

      UploadTask uploadTask = ref.putFile(imagePath!.absolute);
      await Future.value(uploadTask);
      var imageUrl = await ref.getDownloadURL();

      final user = _auth.currentUser;

      QuestionPapersModel newData = QuestionPapersModel(
        title: title.text,
        category: selectedCategory.value.toLowerCase(),
        date: date.value.toString(),
        image: imageUrl,
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
      print(e);
    }
    isLoading.value = false;
  }
}
