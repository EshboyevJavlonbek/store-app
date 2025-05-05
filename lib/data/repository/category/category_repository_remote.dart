import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/category/category_model.dart';
import 'package:store_app/data/interfaces/category_repository_interface.dart';

class CategoryRepositoryRemote implements ICategoryRepository{
  final ApiClient client;

  CategoryRepositoryRemote({required this.client});

  List<CategoryModel> categories = [];

  @override
  Future<List<CategoryModel>> getCategories()async{
    var rawCategories= await client.genericGetRequest<List<dynamic>>('/categories/list');
    categories = rawCategories.map((category) => CategoryModel.fromJson(category)).toList();
    return categories;
  }
}