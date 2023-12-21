import 'dart:io';
import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/models/questionpapers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      QuestionPapersModel questionPaper =
                          snapshot.data as QuestionPapersModel;
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 530,
                              child: PageView.builder(
                                  itemCount: questionPaper.image.length,
                                  itemBuilder: (context, index) {
                                    return FullScreenWidget(
                                      disposeLevel: DisposeLevel.High,
                                      child: InteractiveViewer(
                                        minScale: 1,
                                        maxScale: 5,
                                        child: Image.network(
                                          questionPaper.image[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  }),
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
                                  downloadImages(questionPaper.image);
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

  void downloadImages(List<String> imageUrls) async {
    for (String imageUrl in imageUrls) {
      await downloadImage(imageUrl);
    }
  }

  Future<void> downloadImage(String imageUrl) async {
    var time = DateTime.now().microsecondsSinceEpoch;
    var path = "/storage/emulated/0/Download/image-$time.jpg";
    var file = File(path);

    try {
      var response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        Get.snackbar("Downloading", "Download completed.");
      } else {
        Get.snackbar("Error", "Failed to download.");
      }
    } catch (error) {
      Get.snackbar("Error", "Failed to download");
    }
  }
}
