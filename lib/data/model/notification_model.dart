class NotificationModel {
  final int id;
  final String image, title, subTitle;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      image: json['icon'],
      subTitle: json['content'],
      date: DateTime.parse(json['date']),
    );
  }
}
