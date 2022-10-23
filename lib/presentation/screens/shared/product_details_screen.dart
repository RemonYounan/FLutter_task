import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/product_details_screen/more_details_widget.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/product_details_screen/name_and_type_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/product_details_screen/price_and_add_to_cart_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/product_details_screen/product_details_app_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/product_details_screen/product_main_image_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/product_details_screen/view_store_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.product, Key? key})
      : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.blue.withOpacity(.85),
                AppColors.blue.withOpacity(0),
              ],
              stops: const [0.0, 0.3],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductDetailsAppBar(),
                  SizedBox(height: 1.h),
                  NameAndTypeWidget(product: product),
                  SizedBox(height: 1.h),
                  ProductMainImageWidget(product: product),
                  SizedBox(height: 4.h),
                  const ViewStoreWidget(),
                  SizedBox(height: 4.h),
                  PriceAndAddToCartWidget(product: product),
                  SizedBox(height: 1.h),
                  Divider(
                    color: AppColors.grey,
                    thickness: 1,
                    indent: 6.w,
                    endIndent: 6.w,
                  ),
                  SizedBox(height: 3.h),
                  MoreDetailsWidget(product: product),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
