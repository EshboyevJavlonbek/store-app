import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/detail_repository.dart';
import 'details_state.dart';

part 'details_event.dart';

class DetailsBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository _detailRepo;

  DetailsBloc({
    required DetailRepository repo,
    required int id,
  })  : _detailRepo = repo,
        super(DetailState.initial()) {
    on<DetailLoading>(_onLoading);
    add(DetailLoading(productId: id));
  }

  Future<void> _onLoading(DetailLoading event, Emitter<DetailState> emit) async {
    emit(state.copyWith(status: DetailStatus.loading));
    final detail = await _detailRepo.fetchProductDetail(event.productId);
    emit(state.copyWith(detail: detail, status: DetailStatus.success));
  }
}
