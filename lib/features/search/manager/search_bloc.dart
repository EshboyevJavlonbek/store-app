import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/search_repository.dart';
import 'package:store_app/features/search/manager/search_state.dart';

part 'search_events.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  SearchBloc({required SearchRepository repo})
      : _repo = repo,
        super(SearchState.initial()) {
    on<SearchRequest>(_onLoad);
    on<SearchClear>(_onClear);
  }

  final SearchRepository _repo;

  Future<void> _onLoad(SearchRequest event, Emitter<SearchState> emit) async {
    final query = event.title.trim();
    if (query.isEmpty) {
      emit(state.copyWith(products: [], status: SearchStatus.idle));
      return;
    }
    emit(state.copyWith(products: [], status: SearchStatus.loading));
    try {
      final products = await _repo.getSearchResult(event.title);
      emit(state.copyWith(products: products, status: SearchStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.error));
    }
  }

  Future<void> _onClear(SearchClear event, Emitter<SearchState> emit)async{
    emit(state.copyWith(products: [], status: SearchStatus.idle));
  }
}
