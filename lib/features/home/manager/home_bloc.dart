import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final CategoryRepository _repo;

  HomeBloc({required CategoryRepository repo})
      : _repo = repo,
        super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad());
  }

  Future<void> _onLoad(HomeEvents event, Emitter<HomeState> emit) async {
    emit(state.copyWidth(status: HomeStatus.loading));
    final categories = await _repo.getCategories();
    emit(state.copyWidth(categories: categories, status: HomeStatus.success));
  }
}
