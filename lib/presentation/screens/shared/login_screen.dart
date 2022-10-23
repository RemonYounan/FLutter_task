import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/login_screen/login_input_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/login_screen/login_with_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              height: 44.h,
              child: Image.asset(
                AppAssets.loginImage,
                fit: BoxFit.cover,
                color: const Color(0xff0062BD).withOpacity(0.33),
                colorBlendMode: BlendMode.srcOver,
              ),
            ),
            Positioned(
              top: 35.h,
              left: 0,
              child: Container(
                height: 70.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  color: AppColors.white,
                ),
                child: const LoginWithWidget(),
              ),
            ),
            Positioned(
              top: 22.h,
              child: Container(
                height: 42.h,
                width: 88.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.25),
                      blurRadius: 20,
                      offset: const Offset(2, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.white,
                ),
                child: const LoginInputWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
