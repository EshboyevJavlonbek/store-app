import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/detail/detail_model.dart';
import 'package:store_app/data/model/size/size_model.dart';

part 'details_state.freezed.dart';
enum DetailStatus { initial, loading, success, error }

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    required DetailModel? detail,
    required DetailStatus status,
    required List<SizeModel> sizes
  }) = _DetailState;

  factory DetailState.initial() {
    return DetailState(
      detail: null,
      status: DetailStatus.initial,
      sizes: [],
    );
  }
}
