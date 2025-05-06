import 'package:store_app/core/client.dart';
import 'package:store_app/data/interfaces/product_repository_interface.dart';
import 'package:store_app/data/model/product/product_model.dart';
import 'package:store_app/data/repository/product/product_repository_local.dart';
import 'package:store_app/data/repository/product/product_repository_remote.dart';

class ProductRepository implements IProductRepository {
  ProductRepository({
    required this.client,
    required this.localRepo,
    required this.remoteRepo,
  });

  final ApiClient client;
  final ProductRepositoryLocal localRepo;
  final ProductRepositoryRemote remoteRepo;

  List<ProductModel> products = [];
  List<ProductModel> savedItems = [];

  @override
  Future<List<ProductModel>> getProducts({required int productId}) async {
    final products = await localRepo.getProducts(productId: productId);
    if (products.isNotEmpty) return products;
    return await remoteRepo.getProducts(productId: productId);
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
