import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/add_topics_controller.dart';
import 'package:bbselearning/views/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddInformationScreen extends StatefulWidget {
  const AddInformationScreen({super.key});

  @override
  State<AddInformationScreen> createState() => _AddInformationScreenState();
}

class _AddInformationScreenState extends State<AddInformationScreen> {
  AddTopicController _addTopicController = Get.put(AddTopicController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: primaryColor,
        title: const Center(
          child: Text(
            "Add Topics",
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
                  key: _addTopicController.form_key,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        hinttext: "Enter Topic Title",
                        controller: _addTopicController.title,
                        validateMsg: '',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          errorMaxLines: 1,
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                        value: _addTopicController.selectedCategory.value,
                        items: _addTopicController.category.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: textLightColor,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (_value) {
                          _addTopicController.selectedCategory.value = _value!;
                        },
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
                            _addTopicController.date.value =
                                "${datePicker.day}-${datePicker.month}-${datePicker.year}";
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Select Date",
                              style: TextStyle(
                                color: textLightColor,
                              ),
                            ),
                            Padding(
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 18, left: 25),
                          elevation: 0,
                          backgroundColor: const Color(0xffF2F2F2),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Select Date",
                              style: TextStyle(
                                color: textLightColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.date_range,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => Text("Date ${_addTopicController.date.value}")),
                Obx(() => Text(_addTopicController.selectedCategory.value)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
