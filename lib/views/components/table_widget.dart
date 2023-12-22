import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreTableScreen extends StatelessWidget {
  final Stream<QuerySnapshot> firestoreStream;

  FirestoreTableScreen({required this.firestoreStream});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Table'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DataRow> dataRows = snapshot.data!.docs.map((doc) {
              // Adjust these lines based on your actual document structure
              String sn = doc['sn'];
              String title = doc['title'];

              return DataRow(
                cells: [
                  DataCell(Container(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        sn,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )),
                  DataCell(Container(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )),
                  DataCell(Container(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle edit action
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Handle delete action
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              );
            }).toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'S.N',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Actions',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: dataRows,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}