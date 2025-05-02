import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/reviews/maneger/reviews_state.dart';
import '../../../data/repository/reviews_repository.dart';

part 'reviews_event.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewRepository _reviewsRepo;

  ReviewsBloc({
    required int productId,
    required ReviewRepository reviewsRepo,
  })  : _reviewsRepo = reviewsRepo,
        super(ReviewsState.initial()) {
    on<ReviewsLoading>(_onLoad);
    on<SortReviews>(_onSort);

    add(ReviewsLoading(productId: productId));
  }

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    try {
      emit(state.copyWith(status: ReviewsStatus.loading));

      final reviews = await _reviewsRepo.fetchReviews(event.productId);

      emit(state.copyWith(
        reviews: reviews,
        status: ReviewsStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReviewsStatus.error,
      ));
    }
  }

  void _onSort(SortReviews event, Emitter<ReviewsState> emit) {
    final sorted = [...state.reviews];
    switch (event.sortType) {
      case SortType.lowestToHighest:
        sorted.sort((a, b) => a.rating.compareTo(b.rating));
        break;
      case SortType.highestToLowest:
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SortType.newestToOldest:
        sorted.sort((a, b) => b.created.compareTo(a.created));
        break;
      case SortType.oldestToNewest:
        sorted.sort((a, b) => a.created.compareTo(b.created));
        break;
    }

    emit(state.copyWith(reviews: sorted));
  }
}
