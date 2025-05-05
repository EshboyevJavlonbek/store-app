import 'package:store_app/data/model/category/category_model.dart';

abstract interface class ICategoryRepository{
  Future<List<CategoryModel>> getCategories();
}