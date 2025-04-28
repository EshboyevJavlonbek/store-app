class ReviewsModel {
  final int id;
  final String comment;
  final num rating;
  final DateTime created;
  final String userFullName;

  ReviewsModel({
    required this.created,
    required this.userFullName,
    required this.id,
    required this.comment,
    required this.rating,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      id: json['id'],
      comment: json['comment'],
      rating: (json['rating'] as num).toDouble(),
      created: DateTime.parse(json["created"]),
      userFullName: json["userFullName"],
    );
  }
}
