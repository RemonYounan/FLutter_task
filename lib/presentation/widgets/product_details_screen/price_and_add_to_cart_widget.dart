import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/button_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class PriceAndAddToCartWidget extends StatelessWidget {
  const PriceAndAddToCartWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                '${product.price} EGP',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ),
        ButtonWidget(
          child: const Text('Add To Cart'),
          size: Size(55.w, 6.h),
          borderRadius: 10,
          onPressed: () {
            fToast.init(context);
            showToast('Item added to cart.');
          },
        ),
      ],
    );
  }
}
