import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPapersModel {
  String? id;
  String? title;
  String? category;
  Timestamp? date;
  DocumentReference? image;
  String? user;

  QuestionPapersModel({
    this.id,
    this.title,
    this.category,
    this.date,
    this.image,
    this.user,
  });

  // Deserialize from Firestore document data
  factory QuestionPapersModel.fromMap(Map<String, dynamic> map) {
    return QuestionPapersModel(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      date: map['date'] as Timestamp?, // Adjust type to Timestamp
      image: map['image']
          as DocumentReference?, // Adjust type to DocumentReference
      user: map['user'],
    );
  }

  // Serialize to Firestore document data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date,
      'image': image,
      'user': user,
    };
  }
}
