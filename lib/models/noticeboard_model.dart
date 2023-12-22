class NoticeBoardModel {
  String date;
  String descriptions;
  List<String> image;
  String title;
  String user;

  NoticeBoardModel({
    required this.date,
    required this.descriptions,
    required this.image,
    required this.title,
    required this.user,
  });

  factory NoticeBoardModel.fromMap(Map<String, dynamic> map) {
    return NoticeBoardModel(
      date: map['date'],
      descriptions: map['descriptions'],
      image: List<String>.from(map['image']),
      title: map['title'],
      user: map['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'descriptions': descriptions,
      'image': image,
      'title': title,
      'user': user,
    };
  }
}
