import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class ProductMainImageWidget extends StatelessWidget {
  ProductMainImageWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  final productImages = [
    AppAssets.productImage1,
    AppAssets.productImage2,
    AppAssets.productImage3,
    AppAssets.productImage4,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 36.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.20),
                  blurRadius: 4,
                  spreadRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Hero(
            tag: product.id,
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: FadeInImage.assetNetwork(
                placeholder: AppAssets.loadingGif,
                image: product.image,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        SizedBox(
          height: 16.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: productImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
                child: Container(
                  width: 25.5.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.20),
                        blurRadius: 4,
                        spreadRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Image.asset(productImages[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
