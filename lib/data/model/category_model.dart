class CategoryModel {
  final String image, title;
  final int price, discount;
  final bool isLiked;

  CategoryModel({
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
    required this.isLiked,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      image: json['image'],
      title: json['title'],
      price: json['price'],
      discount: json['discount'],
      isLiked: json['isLiked'],
    );
  }
}
