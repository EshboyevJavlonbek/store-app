import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/product/product_repository.dart';
import 'package:store_app/data/repository/search_repository.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';

import '../../../data/repository/category/category_repository.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final ProductRepository _repo;
  final SearchRepository _searchRepo;
  final CategoryRepository _catRepo;

  HomeBloc({
    required ProductRepository repo,
    required SearchRepository searchRepo,
    required CategoryRepository catRepo,
  })  : _catRepo = catRepo,
        _repo = repo,
        _searchRepo = searchRepo,
        super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    on<HomeSearch>(_searchLoad);
    on<HomeSaved>(_homeSaved);
    on<HomeUnSaved>(_homeUnSaved);
    on<ChangeCategory>(_changedCategory);
  }

  Future<void> _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await _repo.getProducts(productId: event.categoryId);
    final categories = await _catRepo.getCategories();
    categories.sort((a, b) => a.id.compareTo(b.id));
    emit(state.copyWith(
      categories: categories,
      products: products,
      status: HomeStatus.error,
    ));
  }

  Future<void> _changedCategory(ChangeCategory event, Emitter<HomeState> emit)async{
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await _repo.getProducts(productId: event.categoryId);
    emit(state.copyWith(selectedCategory: event.categoryId, products: products, status: HomeStatus.success));
  }

  Future<void> _searchLoad(HomeSearch event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final searchResult = await _searchRepo.getSearchResult(event.title);
    emit(state.copyWith(status: HomeStatus.success, products: searchResult));
  }

  Future<void> _homeUnSaved(HomeUnSaved event, Emitter<HomeState> emit) async {
    await _repo.unSavedItem(productId: event.productId);
  }

  Future<void> _homeSaved(HomeSaved event, Emitter<HomeState> emit) async {
    await _repo.savedItem(productId: event.productId);
  }
}
