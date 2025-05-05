import 'package:hive/hive.dart';
import 'package:store_app/data/model/category/category_model.dart';
import 'package:store_app/data/interfaces/category_repository_interface.dart';

class CategoryRepositoryLocal implements ICategoryRepository{
  @override
  Future<List<CategoryModel>> getCategories()async{
    if (!Hive.isBoxOpen('categories')) {
      Hive.openBox<CategoryModel>('categories');
    }
    final box = Hive.box<CategoryModel>('categories');
    final categories = box.values.toList();
    return categories;
  }
}