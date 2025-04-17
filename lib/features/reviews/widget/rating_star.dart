import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingStar extends StatelessWidget {
  final Map<int, int> ratingCounts;
  final int totalRatings;

  const RatingStar({
    super.key,
    required this.ratingCounts,
    required this.totalRatings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        int star = 5 - index;
        int count = ratingCounts[star] ?? 0;
        double percentage = totalRatings == 0 ? 0 : count / totalRatings;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Row(
                children: List.generate(5, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: SvgPicture.asset(
                      "assets/icons/star_filled.svg",
                      width: 20,
                      colorFilter: ColorFilter.mode(i < star ? Colors.orange : const Color(0xffE6E6E6), BlendMode.srcIn),
                    ),
                  );
                }),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6E6E6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentage,
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
