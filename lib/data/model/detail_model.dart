class DetailModel {
  final int id, reviewsCount;
  final String title, description;
  final bool isLiked;
  final double rating;
  final double price;
  final List<ProductImagesModel> productImages;

  DetailModel({
    required this.id,
    required this.reviewsCount,
    required this.title,
    required this.description,
    required this.isLiked,
    required this.rating,
    required this.productImages,
    required this.price
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json["id"],
      price: (json["price"] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json['reviewsCount'],
      title: json['title'],
      description: json['description'],
      isLiked: json['isLiked'],
      rating: (json['rating'] as num).toDouble(),
      productImages: (json['productImages'] as List)
          .map((e) => ProductImagesModel.fromJson(e))
          .toList(),
    );
  }

}

class ProductImagesModel {
  final int id;
  final String image;

  ProductImagesModel({
    required this.id,
    required this.image,
  });

  factory ProductImagesModel.fromJson(Map<String, dynamic> json) {
    return ProductImagesModel(id: json["id"], image: json['image']);
  }
}
