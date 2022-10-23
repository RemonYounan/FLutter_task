// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/login_screen/login_with_icon.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Divider(
                indent: 4.w,
                endIndent: 4.w,
                thickness: 1.sp,
                color: AppColors.lightBlue,
              ),
            ),
            Text(
              translate('login.or'),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.blue.withOpacity(0.6)),
            ),
            Expanded(
              child: Divider(
                indent: 4.w,
                endIndent: 4.w,
                thickness: 1.sp,
                color: AppColors.lightBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginWithIcon(
              path: AppAssets.facebookLogo,
              title: 'Facebook',
            ),
            SizedBox(width: 6.w),
            const LoginWithIcon(
              path: AppAssets.iosLogo,
              title: 'Apple',
            ),
            SizedBox(width: 6.w),
            const LoginWithIcon(
              path: AppAssets.googleLogo,
              title: 'Google',
            ),
          ],
        )
      ],
    );
  }
}
