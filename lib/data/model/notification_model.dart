class NotificationModel {
  final String image, title, subTitle, date;

  NotificationModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      image: json['image'],
      title: json['title'],
      subTitle: json['subTitle'],
      date: json['date'],
    );
  }
}
