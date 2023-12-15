import 'dart:io';
import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/models/questionpapers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class QuestionPreviewScreen extends StatefulWidget {
  const QuestionPreviewScreen({super.key});

  @override
  State<QuestionPreviewScreen> createState() => _QuestionPreviewScreenState();
}

class _QuestionPreviewScreenState extends State<QuestionPreviewScreen> {
  QuestionPapersController questioncontroller =
      Get.put(QuestionPapersController());
  var documentId;

  @override
  void initState() {
    super.initState();
    documentId = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FutureBuilder(
                  future: questioncontroller.getQuestionPaperById(documentId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      QuestionPapersModel questionPaper =
                          snapshot.data as QuestionPapersModel;
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FullScreenWidget(
                              disposeLevel: DisposeLevel.High,
                              child: InteractiveViewer(
                                minScale: 1,
                                maxScale: 5,
                                child: Image.network(
                                  'https://www.shaalaa.com/images/university-of-pune-bcom-french-fybcom-1st-year-fybcom-2017-2018-2013-pattern_2:e3014ae48f034d12aa7aaac4ad54b9a8.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                questionPaper.title!,
                                style: TextStyle(
                                  color: textDarkColor,
                                  fontFamily: "Inter",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                questionPaper.category!,
                                style: const TextStyle(
                                  color: textLightColor,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  downloadimage();
                                },
                                child: const Icon(
                                  Icons.download,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }

  void downloadimage() async {
    var time = DateTime.now().microsecondsSinceEpoch;
    var path = "/storage/emulated/0/Download/image-$time.jpg";
    var file = File(path);
    var res = await get(Uri.parse(
        "https://www.shaalaa.com/images/university-of-pune-bcom-french-fybcom-1st-year-fybcom-2017-2018-2013-pattern_2:e3014ae48f034d12aa7aaac4ad54b9a8.jpg"));
    file.writeAsBytes(res.bodyBytes);
    Get.snackbar("Downlaoding", "Download done.");
  }
}
