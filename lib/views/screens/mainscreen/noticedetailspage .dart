import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/models/questionpapers_model.dart';
import 'package:bbselearning/views/screens/mainscreen/questionpreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeListScreen extends StatefulWidget {
  const NoticeListScreen({super.key});

  @override
  State<NoticeListScreen> createState() => _NoticeListScreenState();
}

class _NoticeListScreenState extends State<NoticeListScreen> {
  QuestionPapersController questioncontroller =
      Get.put(QuestionPapersController());

  CollectionReference users =
      FirebaseFirestore.instance.collection('questionpapers');

  var category;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> questionpapersStrem =
        FirebaseFirestore.instance.collection('noticeslist').snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Notice List"),
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
                          data['date'],
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
