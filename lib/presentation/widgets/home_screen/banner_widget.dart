import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:sizer/sizer.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.homeBannerImage),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Release',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Acer Predator Helios 300',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
