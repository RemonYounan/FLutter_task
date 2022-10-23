import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/helpers/network.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, Key? key}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).pushNamed('/product-details', arguments: product);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 8,
              color: AppColors.black.withOpacity(0.25),
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Hero(
                        tag: product.id,
                        child: Padding(
                            padding: EdgeInsets.all(0.5.h),
                            child: FadeInImage.assetNetwork(
                              placeholder: AppAssets.loadingGif,
                              image: product.image,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    product.company,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w, bottom: 2.h),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.lightBlack,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w, bottom: 2.h),
                  child: Text(
                    '${product.price} EGP',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                fToast.init(context);
                showToast('Item Added To Cart');
              },
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.blue,
                        AppColors.blue.withOpacity(0.4),
                      ]),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 6, 0),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return Positioned(
                  top: 1.h,
                  right: 2.w,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      BlocProvider.of<ProductsCubit>(context)
                          .toggleFavorite(product.id);
                    },
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                      color: product.isFavorite
                          ? Colors.red
                          : AppColors.darkerGrey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
