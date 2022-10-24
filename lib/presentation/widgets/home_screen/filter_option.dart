import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.icon,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          context.read<ProductsCubit>().getFilteredProducts(title);
        },
        child: Container(
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected ? AppColors.blue : AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(2, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: 3.w, top: 0.75.h, right: 6.w, bottom: 0.75.h),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.25),
                          blurRadius: 8,
                          spreadRadius: 4,
                          offset: const Offset(2, 2),
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        icon,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: isSelected ? AppColors.white : AppColors.black,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
