import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:sizer/sizer.dart';

class NameAndTypeWidget extends StatelessWidget {
  const NameAndTypeWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(height: .3.h),
        Text(
          'Type: ${product.type}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
