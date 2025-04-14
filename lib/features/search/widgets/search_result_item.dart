import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.id,
    required this.discount,
  });

  final String image, title;
  final int price, id, discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                width: 56,
                height: 54,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0XFF1A1A1A),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "$price\$",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff808080),
                  ),
                ),
                if (discount != 0)
                  Text(
                    "-$discount%",
                    style: TextStyle(
                      color: Color(0xFFED1010),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
            Spacer(),
            StoreIconButtonContainer(
                image: "assets/icons/export.svg", callback: () {})
          ],
        ),
      ),
    );
  }
}
