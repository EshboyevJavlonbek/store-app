import 'package:hive/hive.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/interfaces/product_repository_interface.dart';

import '../../model/product/product_model.dart';

class ProductRepositoryRemote implements IProductRepository {
  ProductRepositoryRemote({required this.client});

  final ApiClient client;
  List<ProductModel> products = [];
  final Box<ProductModel> box = Hive.box<ProductModel>("products");

  @override
  Future<List<ProductModel>> getProducts({required int productId}) async {
    var rawProducts = await client.genericGetRequest<List<dynamic>>(
        '/products/list',
        queryParams: {"CategoryId": productId});
    products =
        rawProducts.map((category) => ProductModel.fromJson(category)).toList();
    box.addAll(products);
    return products;
  }
}
