import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/product/product_repository.dart';
import 'details_state.dart';

part 'details_event.dart';

class DetailsBloc extends Bloc<DetailEvent, DetailState> {
  final ProductRepository _repo;

  DetailsBloc({
    required ProductRepository repo,
    required int id,
  })  : _repo = repo,
        super(DetailState.initial()) {
    on<DetailLoading>(_onLoading);
    on<DetailSaveProduct>(_detailSaved);
    on<DetailUnSaveProduct>(_detailUnSaved);
    on<DetailAddProduct>(_addProduct);
    add(DetailLoading(productId: id));
  }

  Future<void> _onLoading(
      DetailLoading event, Emitter<DetailState> emit) async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      final detail = await _repo.fetchProductDetail(event.productId);
      final sizes = await _repo.fetchSizes();
      sizes.sort((a,b) => a.id.compareTo(b.id));
      emit(state.copyWith(detail: detail,sizes: sizes, status: DetailStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DetailStatus.error));
    }
  }

  Future<void> _detailSaved(DetailSaveProduct event, Emitter<DetailState> emit) async{
    await _repo.savedItem(productId: event.productId);
  }

  Future<void> _detailUnSaved(DetailUnSaveProduct event, Emitter<DetailState> emit) async{
    await _repo.unSavedItem(productId: event.productId);
  }

  Future<void> _addProduct(DetailAddProduct event, Emitter<DetailState> emit) async{
    await _repo.addProduct(productId: event.productId, sizeId: event.sizeId);
  }
}
