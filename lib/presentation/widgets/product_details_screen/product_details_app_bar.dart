import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 5,
                spreadRadius: 5,
                offset: const Offset(2, 2),
              )
            ]),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.grey,
          size: 28,
        ),
      ),
    );
  }
}
