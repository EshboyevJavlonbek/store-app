import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/detail_model.dart';

class DetailRepository {
  DetailRepository({required this.client});

  final ApiClient client;

  DetailModel? detail;

  Future<DetailModel?> fetchProductDetail(int productId) async {
    final rawDetail = await client
        .genericGetRequest<Map<String, dynamic>>('/products/detail/$productId');
    detail = DetailModel.fromJson(rawDetail);
    return detail!;
  }
}
