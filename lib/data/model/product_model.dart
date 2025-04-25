class ProductModel {
  final String image, title;
  final int price, discount, id;
  final bool isLiked;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
    required this.isLiked,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'],
      title: json['title'],
      price: json['price'],
      discount: json['discount'],
      isLiked: json['isLiked'],
      id: json['id'],
    );
  }
}
