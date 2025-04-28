import 'package:equatable/equatable.dart';
import '../../../data/model/reviews_model.dart';

enum ReviewsStatus { initial, loading, success, error }

class ReviewsState extends Equatable {
  final List<ReviewsModel> reviews;
  final ReviewsStatus status;

  const ReviewsState({
    required this.reviews,
    required this.status,
  });

  factory ReviewsState.initial() => const ReviewsState(
    reviews: [],
    status: ReviewsStatus.initial,
  );

  ReviewsState copyWith({
    List<ReviewsModel>? reviews,
    ReviewsStatus? status,
  }) {
    return ReviewsState(
      reviews: reviews ?? this.reviews,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [reviews, status];
}
