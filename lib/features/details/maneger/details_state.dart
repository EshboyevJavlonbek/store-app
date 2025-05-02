import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/data/model/detail_model.dart';

enum DetailStatus { initial, loading, success, error }

@immutable
class DetailState extends Equatable {
  final DetailModel? detail;
  final DetailStatus status;

  const DetailState({
    required this.detail,
    required this.status,
  });

  factory DetailState.initial() {
    return DetailState(
      detail: null,
      status: DetailStatus.initial,
    );
  }

  DetailState copyWith({
    DetailModel? detail,
    DetailStatus? status,
  }) {
    return DetailState(
      detail: detail ?? this.detail,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [detail, status];
}
