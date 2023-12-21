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

  factory NoticeBoardModel.fromMap(Map<String, dynamic> json) {
    return NoticeBoardModel(
      date: json['date'],
      descriptions: json['descriptions'],
      image: List<String>.from(json['image']),
      title: json['title'],
      user: json['user'],
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
