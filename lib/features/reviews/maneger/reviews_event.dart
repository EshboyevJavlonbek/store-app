part of 'reviews_bloc.dart';

enum SortType {
  highestToLowest,
  lowestToHighest,
  newestToOldest,
  oldestToNewest,
}

abstract class ReviewsEvent {}

class ReviewsLoading extends ReviewsEvent {
  final int productId;
  ReviewsLoading({required this.productId});
}

class SortReviews extends ReviewsEvent {
  final SortType sortType;
  SortReviews(this.sortType);
}
