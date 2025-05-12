import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/detail/detail_model.dart';

class DetailToReview extends StatelessWidget {
  const DetailToReview({
    super.key,
    required this.detail,
  });

  final DetailModel? detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/star_filled.svg"),
        SizedBox(width: 4),
        RichText(
          text: TextSpan(
            text: '${detail!.rating.toStringAsFixed(1)}/5 ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "General Sans",
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.push(Routes.getReviews(detail!.id)),
                text: '(${detail!.reviewsCount} reviews)',
                style: TextStyle(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
