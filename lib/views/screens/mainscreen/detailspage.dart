import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/models/questionpapers_model.dart';
import 'package:bbselearning/views/screens/mainscreen/questionpreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  QuestionPapersController questioncontroller =
      Get.put(QuestionPapersController());

  var category;

  @override
  void initState() {
    super.initState();
    category = Get.arguments;
    questioncontroller.category.value = category.toString().toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> questionpapersStrem = FirebaseFirestore.instance
        .collection('questionpapers')
        .where('category', isEqualTo: questioncontroller.category.value)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(category),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: questionpapersStrem,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return InkWell(
                    onTap: () {
                      Get.to(const QuestionPreviewScreen(),
                          transition: Transition.rightToLeft,
                          arguments: document.id);
                    },
                    child: Card(
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        title: Text(
                          data['title'],
                          style: TextStyle(
                            color: textDarkColor,
                            fontFamily: "Inter",
                            fontSize: 16.sp,
                          ),
                        ),
                        subtitle: Text(
                          data['category'],
                          style: const TextStyle(
                            color: textLightColor,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 28,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
