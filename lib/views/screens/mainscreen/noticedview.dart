import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/notice_controller.dart';
import 'package:bbselearning/models/noticeboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';

class NoticedViewScreen extends StatefulWidget {
  const NoticedViewScreen({super.key});

  @override
  State<NoticedViewScreen> createState() => _NoticedViewScreenState();
}

class _NoticedViewScreenState extends State<NoticedViewScreen> {
  NoticeController noticecontroller = Get.put(NoticeController());

  var documentId;
  @override
  void initState() {
    super.initState();
    documentId = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notice Board"),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: noticecontroller.getNoticeById(documentId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  NoticeBoardModel noticedata =
                      snapshot.data as NoticeBoardModel;
                  return Card(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noticedata.title,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: textDarkColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              noticedata.date,
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textLightColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              noticedata.descriptions,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                color: textDarkColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 550,
                              child: PageView.builder(
                                  itemCount: noticedata.image.length,
                                  itemBuilder: (context, index) {
                                    return FullScreenWidget(
                                      disposeLevel: DisposeLevel.High,
                                      child: InteractiveViewer(
                                        minScale: 1,
                                        maxScale: 5,
                                        child: Image.network(
                                            noticedata.image[index]),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
