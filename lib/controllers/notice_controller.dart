import 'dart:io';

import 'package:bbselearning/models/noticeboard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';

class NoticeController extends GetxController {
  RxString date = "".obs;
  RxBool isLoading = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController descriptions = TextEditingController();
  final form_key = GlobalKey<FormState>();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<XFile> _images = [];
  File? imagePath;
  RxBool imgpath = false.obs;

  Future<void> getImage() async {
    _images.clear();

    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      imgpath.value = true;
      for (var image in images) {
        _images.add(image);
      }
    }
  }

  deleteData(documentId) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('questionpapers');
    DocumentReference documentReference =
        collectionReference.doc(documentId.toString());

    try {
      await documentReference.delete();
      print('Document deleted successfully!');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  deleteNotice(documentId) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('noticeslist');
    DocumentReference documentReference =
        collectionReference.doc(documentId.toString());

    try {
      await documentReference.delete();
      print('Document deleted successfully!');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  clearForm() {
    title.clear();
    date.value = "";
    imgpath.value = false;
    descriptions.clear();
  }

  addnotice() async {
    isLoading.value = true;

    if (date.isNotEmpty && _images.isNotEmpty && descriptions.text.isNotEmpty) {
      try {
        CollectionReference collectionReference =
            FirebaseFirestore.instance.collection('noticeslist');

        List<String> imageUrls =
            []; // To store download URLs of all uploaded images

        for (var imageFile in _images) {
          final firebase_storage.Reference ref =
              firebase_storage.FirebaseStorage.instance.ref(
                  '/noticeimage/${DateTime.now()}_${_images.indexOf(imageFile)}.jpg');

          UploadTask uploadTask = ref.putFile(File(imageFile.path));
          await uploadTask;
          var imageUrl = await ref.getDownloadURL();

          imageUrls.add(imageUrl); // Collecting the download URLs

          // You may add some delay here if needed
          // await Future.delayed(Duration(seconds: 1));
        }

        final user = _auth.currentUser;

        NoticeBoardModel newData = NoticeBoardModel(
          title: title.text,
          date: date.value.toString(),
          image: imageUrls,
          descriptions: descriptions.text,
          user: user?.uid ?? '',
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
    } else {
      Get.snackbar("Errors", "All Field is Requeard ");
      isLoading.value = false;
    }
  }

  Future<NoticeBoardModel?> getNoticeById(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('noticeslist')
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return NoticeBoardModel.fromMap(data);
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}
