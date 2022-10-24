import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ViewStoreWidget extends StatelessWidget {
  const ViewStoreWidget({
    required this.companyName,
    Key? key,
  }) : super(key: key);

  final String companyName;

  String getImage(String company) {
    switch (company) {
      case 'Acer':
        return AppAssets.acerLogo1;
      case 'Razer':
        return AppAssets.razerLogo;
      case 'Apple':
        return AppAssets.iosLogo;

      default:
        return AppAssets.acerLogo1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 9.h,
              width: 14.w,
              decoration: BoxDecoration(
                color: AppColors.darkerWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.20),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Image.asset(
                getImage(companyName),
                height: 5.h,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$companyName Official Store',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'View Store',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.darkerWhite,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.20),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.lightBlue,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
