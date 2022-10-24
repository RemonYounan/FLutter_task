import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/home_screen/banner_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/home_screen/filters_options.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/home_screen/home_app_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/home_screen/products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.blue.withOpacity(.85),
                AppColors.blue.withOpacity(0),
              ],
              stops: const [0.0, 0.5],
            ),
          ),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: () {
                BlocProvider.of<ProductsCubit>(context).getProducts();
                return Future.value();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Column(
                    children: [
                      const HomeAppBar(),
                      SizedBox(
                        height: 2.h,
                      ),
                      const BannerWidget(),
                      SizedBox(
                        height: 2.h,
                      ),
                      const FiltersOptions(),
                      SizedBox(
                        height: 2.h,
                      ),
                      const ProductsWidget(),
                      SizedBox(
                        height: 6.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
