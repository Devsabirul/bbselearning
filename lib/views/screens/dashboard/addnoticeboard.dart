import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/add_topics_controller.dart';
import 'package:bbselearning/controllers/notice_controller.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/views/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNoticeBoardScreen extends StatefulWidget {
  const AddNoticeBoardScreen({super.key});

  @override
  State<AddNoticeBoardScreen> createState() => _AddNoticeBoardScreenState();
}

class _AddNoticeBoardScreenState extends State<AddNoticeBoardScreen> {
  final NoticeController _addNoticecontroller = Get.put(NoticeController());
  QuestionPapersController questioncontroller =
      Get.put(QuestionPapersController());

  @override
  void dispose() {
    super.dispose();
    questioncontroller.getLength("accounting");
    questioncontroller.getLength("economics");
    questioncontroller.getLength("management");
    questioncontroller.getLength("compulsory");
    questioncontroller.topicsLength();
    questioncontroller.noticeBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: primaryColor,
        title: const Center(
          child: Text(
            "Add Notice",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _addNoticecontroller.form_key,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        hinttext: "Enter Notice Title",
                        controller: _addNoticecontroller.title,
                        validateMsg: '',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 18, left: 25),
                          elevation: 0,
                          backgroundColor: const Color(0xffF2F2F2),
                        ),
                        onPressed: () async {
                          DateTime? datePicker = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2030));

                          if (datePicker != null) {
                            _addNoticecontroller.date.value =
                                "${datePicker.day}-${datePicker.month}-${datePicker.year}";
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => _addNoticecontroller.date.value != ""
                                  ? Text(
                                      _addNoticecontroller.date.value,
                                      style: const TextStyle(
                                        color: textLightColor,
                                      ),
                                    )
                                  : const Text(
                                      "Select Date",
                                      style: TextStyle(
                                        color: textLightColor,
                                      ),
                                    ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.date_range,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _addNoticecontroller.descriptions,
                        style: const TextStyle(
                          fontFamily: "Metropolis",
                          color: textLightColor,
                          fontSize: 16,
                        ),
                        maxLines: 5,
                        decoration: InputDecoration(
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
                          hintText: "Descriptions",
                          hintStyle: const TextStyle(
                            fontFamily: "Metropolis",
                            color: textLightColor,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.only(
                              top: 18, bottom: 18, left: 25),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 18, left: 25),
                          elevation: 0,
                          backgroundColor: const Color(0xffF2F2F2),
                        ),
                        onPressed: () {
                          _addNoticecontroller.getImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => _addNoticecontroller.imgpath.value != ""
                                  ? const Text(
                                      "Image Selected",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    )
                                  : const Text(
                                      "Choose Image ",
                                      style: TextStyle(
                                        color: textLightColor,
                                      ),
                                    ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.camera_alt,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_addNoticecontroller.form_key.currentState!
                        .validate()) {
                      _addNoticecontroller.addnotice();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: Size(Get.width, 53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Obx(
                    () => _addNoticecontroller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Add Notice",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
