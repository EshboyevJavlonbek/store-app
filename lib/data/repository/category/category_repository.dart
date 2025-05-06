import 'package:store_app/data/interfaces/category_repository_interface.dart';
import 'package:store_app/data/model/category/category_model.dart';
import 'package:store_app/data/repository/category/category_repository_local.dart';
import 'package:store_app/data/repository/category/category_repository_remote.dart';

class CategoryRepository implements ICategoryRepository {
  final CategoryRepositoryLocal localRepo;
  final CategoryRepositoryRemote remoteRepo;

  CategoryRepository({required this.localRepo, required this.remoteRepo});

  bool isBool = true;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await localRepo.getCategories();
    if (categories.isNotEmpty) return categories;

    return await remoteRepo.getCategories();
  }
}
