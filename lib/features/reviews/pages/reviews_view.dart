import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/reviews/maneger/reviews_bloc.dart';
import 'package:store_app/features/reviews/maneger/reviews_state.dart';
import 'package:store_app/features/reviews/widget/rating_star.dart';
import 'package:store_app/features/reviews/widget/star_rating.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key});

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  SortType _selectedSort = SortType.highestToLowest;

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              title: const Text('Past → Yuqori baho'),
              onTap: () {
                context.read<ReviewsBloc>().add(SortReviews(SortType.lowestToHighest));
                setState(() => _selectedSort = SortType.lowestToHighest);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Yuqori → Past baho'),
              onTap: () {
                context.read<ReviewsBloc>().add(SortReviews(SortType.highestToLowest));
                setState(() => _selectedSort = SortType.highestToLowest);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Yangi → Eski'),
              onTap: () {
                context.read<ReviewsBloc>().add(SortReviews(SortType.newestToOldest));
                setState(() => _selectedSort = SortType.newestToOldest);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Eski → Yangi'),
              onTap: () {
                context.read<ReviewsBloc>().add(SortReviews(SortType.oldestToNewest));
                setState(() => _selectedSort = SortType.oldestToNewest);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  String _sortTypeText(SortType sortType) {
    switch (sortType) {
      case SortType.lowestToHighest:
        return 'Past → Yuqori';
      case SortType.highestToLowest:
        return 'Yuqori → Past';
      case SortType.newestToOldest:
        return 'Yangi → Eski';
      case SortType.oldestToNewest:
        return 'Eski → Yangi';
      default:
        return 'Saralash';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    if (difference == 0) return "Today";
    if (difference == 1) return "1 day ago";
    return "$difference days ago";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Reviews",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Divider(color: Color(0xffE6E6E6), thickness: 2),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<ReviewsBloc, ReviewsState>(
          builder: (context, state) {
            if (state.status == ReviewsStatus.loading) {
              return  Center(child: CircularProgressIndicator());
            }

            if (state.status == ReviewsStatus.error) {
              return  Center(child: Text("Error loading reviews"));
            }

            final reviews = state.reviews;
            final ratingCounts = <int, int>{};

            for (var r in reviews) {
              final rating = r.rating.round();
              ratingCounts[rating] = (ratingCounts[rating] ?? 0) + 1;
            }

            final totalRatings = ratingCounts.values.fold(0, (a, b) => a + b);
            double averageRating = 0;
            for (int i = 1; i <= 5; i++) {
              averageRating += i * (ratingCounts[i] ?? 0);
            }
            if (totalRatings > 0) averageRating /= totalRatings;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      averageRating.toStringAsFixed(1),
                      style:  TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'General Sans',
                      ),
                    ),
                     SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2),
                              child: SvgPicture.asset(
                                "assets/icons/star_filled.svg",
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  index < averageRating.round()
                                      ? Colors.orange
                                      :  Color(0xffE6E6E6),
                                  BlendMode.srcIn,
                                ),
                              ),
                            );
                          }),
                        ),
                         SizedBox(height: 8),
                        Text(
                          "$totalRatings Ratings",
                          style:  TextStyle(
                            color: Color(0xff808080),
                            fontSize: 16,
                            fontFamily: 'General Sans',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                RatingStar(
                  ratingCounts: ratingCounts,
                  totalRatings: totalRatings,
                ),
                 Divider(color: Color(0xffE6E6E6), thickness: 2),
                Row(
                  children: [
                    Text(
                      "${reviews.length} Reviews",
                      style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'General Sans',
                      ),
                    ),
                     Spacer(),
                    Text(
                      _sortTypeText(_selectedSort),
                      style:  TextStyle(
                        color: Color(0xff808080),
                        fontSize: 12,
                        fontFamily: 'General Sans',
                      ),
                    ),
                     SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _showSortOptions(context),
                      child: SvgPicture.asset("assets/icons/dropdown.svg"),
                    )
                  ],
                ),
                 SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: reviews.length,
                    separatorBuilder: (_, __) =>
                     Divider(color: Color(0xffE6E6E6)),
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StarRating(rating: review.rating.toInt()),
                           SizedBox(height: 4),
                          Text(
                            review.comment,
                            style:  TextStyle(
                              color: Color(0xff808080),
                              fontSize: 14,
                              fontFamily: 'General Sans',
                            ),
                          ),
                           SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                review.userFullName,
                                style:  TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'General Sans',
                                ),
                              ),
                               SizedBox(width: 8),
                              Text(
                                "• ${_formatDate(review.created)}",
                                style:  TextStyle(
                                  color: Color(0xff808080),
                                  fontSize: 14,
                                  fontFamily: 'General Sans',
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
