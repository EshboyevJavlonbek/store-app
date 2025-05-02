import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/product_model.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;

  List<ProductModel> products = [];
  List<ProductModel> savedItems = [];

  Future<List<ProductModel>> getProducts({required int categoryId}) async {
    var rawProducts =
        await client.genericGetRequest<List<dynamic>>('/products/list', queryParams: {"CategoryId": categoryId});
    products = rawProducts
        .map((category) => ProductModel.fromJson(category))
        .toList();
    return products;
  }

  Future<List<ProductModel>> getSavedItems() async {
    var rawSavedItems = await client
        .genericGetRequest<List<dynamic>>('/products/saved-products');
    products =
        rawSavedItems.map((item) => ProductModel.fromJson(item)).toList();
    return products;
  }

  Future<void> savedItem({required productId}) async {
    await client.saveItem(productId: productId);
  }

  Future<void> unSavedItem({required productId}) async {
    await client.unSaveItem(productId: productId);
  }
}
