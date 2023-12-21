class QuestionPapersModel {
  String? id;
  String? title;
  String? category;
  String? date;
  List<String> image;
  String? user;

  QuestionPapersModel({
    this.id,
    this.title,
    this.category,
    this.date,
    required this.image,
    this.user,
  });

  // Deserialize from Firestore document data
  factory QuestionPapersModel.fromMap(Map<String, dynamic> map) {
    return QuestionPapersModel(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      date: map['date'],
      image: List<String>.from(map['image']),
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
