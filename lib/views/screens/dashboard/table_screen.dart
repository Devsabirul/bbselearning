import 'package:bbselearning/constants.dart';
import 'package:bbselearning/controllers/notice_controller.dart';
import 'package:bbselearning/controllers/questionpapers_controller.dart';
import 'package:bbselearning/views/screens/dashboard/dashboard_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableViewScreen extends StatefulWidget {
  const TableViewScreen({super.key});

  @override
  State<TableViewScreen> createState() => _TableViewScreenState();
}

class _TableViewScreenState extends State<TableViewScreen> {
  final Stream<QuerySnapshot> questionpapersStrem =
      FirebaseFirestore.instance.collection('questionpapers').snapshots();
  final Stream<QuerySnapshot> noticeboard =
      FirebaseFirestore.instance.collection('noticeslist').snapshots();

  final NoticeController _noticeController = Get.put(NoticeController());
  final QuestionPapersController _questioncontroller =
      Get.put(QuestionPapersController());

  @override
  void dispose() {
    super.dispose();
    print("object");
    _questioncontroller.getLength("accounting");
    _questioncontroller.getLength("economics");
    _questioncontroller.getLength("management");
    _questioncontroller.getLength("compulsory");
    _questioncontroller.topicsLength();
    _questioncontroller.noticeBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: primaryColor,
        titleSpacing: 0,
        title: const Text(
          "Tables View",
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Queastion List Table:",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textDarkColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: questionpapersStrem,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            List<DataRow> rows = [];
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                            } else {
                              // Add table rows when there is data
                              rows.addAll(snapshot.data!.docs.map((document) {
                                Map<String, dynamic> data =
                                    document.data() as Map<String, dynamic>;
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(data['title'] ?? ''),
                                    ),
                                    DataCell(
                                      Text(data['category'] ?? ''),
                                    ),
                                    DataCell(
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            _noticeController
                                                .deleteData(document.id);
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }));
                            }

                            return DataTable(
                              columns: const [
                                DataColumn(label: Text('Title')),
                                DataColumn(label: Text('Category')),
                                DataColumn(label: Text('Action')),
                              ],
                              rows: rows,
                              border: TableBorder.all(),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Notice List Table:",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textDarkColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: noticeboard,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            List<DataRow> rows =
                                snapshot.data!.docs.map((document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(data['title'] ?? ''),
                                  ),
                                  DataCell(
                                    Text(data['date'] ?? ''),
                                  ),
                                  DataCell(
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          _noticeController
                                              .deleteNotice(document.id);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList();

                            return DataTable(
                              columns: const [
                                DataColumn(label: Text('Title')),
                                DataColumn(label: Text('Date')),
                                DataColumn(label: Text('Action')),
                              ],
                              rows: rows,
                              border: TableBorder.all(),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
