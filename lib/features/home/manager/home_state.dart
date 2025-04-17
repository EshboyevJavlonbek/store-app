import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/category_model.dart';

enum HomeStatus { idle, loading, error, success }

class HomeState extends Equatable {
  final List<CategoryModel> categories;
  final HomeStatus status;

  const HomeState({
    required this.categories,
    required this.status,
  });

  factory HomeState.initial() {
    return HomeState(
      categories: [],
      status: HomeStatus.idle,
    );
  }

  HomeState copyWidth({
    HomeStatus? status,
    List<CategoryModel>? categories,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [categories, status];
}
