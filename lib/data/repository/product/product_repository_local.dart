import 'package:hive/hive.dart';
import 'package:store_app/data/interfaces/product_repository_interface.dart';
import 'package:store_app/data/model/product/product_model.dart';

class ProductRepositoryLocal implements IProductRepository {
  @override
  Future<List<ProductModel>> getProducts({required int productId}) async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> saveProducts(List<ProductModel> products) async {
    final box = await _openBox();
    await box.clear();
    await box.addAll(products);
  }

  Future<Box<ProductModel>> _openBox() async {
    if (!Hive.isBoxOpen('products')) {
      await Hive.openBox<ProductModel>('products');
    }
    return Hive.box<ProductModel>('products');
  }
}
