import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_card.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/loading_widget.dart';
import 'package:sizer/sizer.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return SizedBox(
            height: 30.h,
            child: LoadingWidget(
              color: AppColors.blue.withOpacity(0.85),
            ),
          );
        } else {
          final products = context.read<ProductsCubit>().products;
          if (products.isNotEmpty) {
            final List<Widget> items = [
              Text(
                'Recomended for You',
                style: Theme.of(context).textTheme.headlineLarge,
                overflow: TextOverflow.clip,
              ),
              ...List.generate(products.length,
                  (index) => ProductCard(product: products[index])),
            ];
            return MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 2.h,
              gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 50.w,
              ),
              itemCount: products.length + 1,
              itemBuilder: (context, index) {
                return items[index];
              },
            );
          } else {
            return const Text(
              'No data',
              style: TextStyle(fontSize: 30, color: Colors.black),
            );
          }
        }
      },
    );
  }
}
