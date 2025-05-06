import 'package:hive/hive.dart';
import 'package:store_app/data/interfaces/product_repository_interface.dart';
import 'package:store_app/data/model/product/product_model.dart';

class ProductRepositoryLocal implements IProductRepository{
  @override
  Future<List<ProductModel>> getProducts({required int productId})async{
    if (!Hive.isBoxOpen('products')) {
      Hive.openBox<ProductModel>('products');
    }
    final box = Hive.box<ProductModel>('products');
    final products = box.values.toList();
    return products;
  }
}