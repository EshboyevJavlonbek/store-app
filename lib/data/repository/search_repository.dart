import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/product_model.dart';

class SearchRepository{
  SearchRepository({required this.client});
  final ApiClient client;

  List<ProductModel> categories = [];

  Future<List<ProductModel>> getSearchResult(String title) async{
    var response = await client.genericGetRequest<List<dynamic>>('/products/list?Title=$title');
    categories = response.map((category) => ProductModel.fromJson(category)).toList();
    return categories;
  }
}