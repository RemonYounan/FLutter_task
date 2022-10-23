import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/home_screen/filter_option.dart';
import 'package:sizer/sizer.dart';

class FiltersOptions extends StatelessWidget {
  const FiltersOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9.2.h,
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Container();
          } else {
            final products = context.read<ProductsCubit>().products;
            final filtersSet = products.map((e) => e.company).toList().toSet();
            final icons = [
              AppAssets.allLogo,
              AppAssets.acerLogo,
              AppAssets.razerLogo,
              AppAssets.iosLogo,
            ];
            int length = filtersSet.length + 1;
            final filtersList = ['All', ...filtersSet.toList()];
            return ListView.builder(
              padding: EdgeInsets.only(bottom: 1.h),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: length,
              itemBuilder: (context, index) {
                return FilterOption(
                  title: filtersList[index],
                  icon: icons[index],
                  isSelected: index == 0,
                );
              },
            );
          }
        },
      ),
    );
  }
}
