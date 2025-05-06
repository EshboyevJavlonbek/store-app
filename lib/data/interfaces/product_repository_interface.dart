import 'package:store_app/data/model/product/product_model.dart';

abstract interface class IProductRepository{
  Future<List<ProductModel>> getProducts({required int productId});
}