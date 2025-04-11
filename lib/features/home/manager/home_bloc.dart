import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/search_repository.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final CategoryRepository _repo;
  final SearchRepository _searchRepo;

  HomeBloc(
      {required CategoryRepository repo, required SearchRepository searchRepo})
      : _repo = repo,
        _searchRepo = searchRepo,
        super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    on<HomeSearch>(_searchLoad);
    add(HomeLoad());
  }

  Future<void> _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    emit(state.copyWidth(status: HomeStatus.loading));
    final categories = await _repo.getCategories();
    emit(state.copyWidth(categories: categories, status: HomeStatus.success));
  }

  Future<void> _searchLoad(HomeSearch event, Emitter<HomeState> emit) async {
    emit(state.copyWidth(status: HomeStatus.loading));
    final searchResult = await _searchRepo.getSearchResult(event.title);
    emit(state.copyWidth(status: HomeStatus.success, categories: searchResult));
  }
}
