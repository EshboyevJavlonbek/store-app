import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/category/category_model.dart';
import 'package:store_app/data/model/product/product_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { idle, loading, error, success }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<CategoryModel> categories,
    required List<ProductModel> products,
    required int? selectedCategory,
    required HomeStatus status,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      categories: [],
      products: [],
      status: HomeStatus.idle,
      selectedCategory: null,
    );
  }
}
