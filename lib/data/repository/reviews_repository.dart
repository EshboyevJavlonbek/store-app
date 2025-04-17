import '../../core/client.dart';
import '../model/reviews_model.dart';

class ReviewRepository {
  final ApiClient client;

  ReviewRepository({required this.client});

  List<ReviewsModel> products = [];

  Future<List<ReviewsModel>> fetchReviews(int productId) async {
    final rawReviews = await client.genericGetRequest<List<dynamic>>('/reviews/list/$productId');
    products = rawReviews.map((review) => ReviewsModel.fromJson(review)).toList();
    return products;
  }
}


