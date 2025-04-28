import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/category_model.dart';

class CategoryRepository{
  final ApiClient client;

  CategoryRepository({required this.client});

  List<CategoryModel> categories = [];

  Future<List<CategoryModel>> getCategories()async{
    var rawCategories= await client.genericGetRequest<List<dynamic>>('/categories/list');
    categories = rawCategories.map((category) => CategoryModel.fromJson(category)).toList();
    return categories;
  }
}