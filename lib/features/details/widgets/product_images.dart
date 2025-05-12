import 'package:flutter/material.dart';
import 'package:store_app/data/model/detail/detail_model.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key, required this.detail,
  });

  final DetailModel? detail;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: detail!.productImages.length,
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          detail!.productImages[index].image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
