// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/button_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/help_screen/help_item_list_widget.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Help',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const HelpItemsListWidget(),
                  SizedBox(
                    height: 10.h,
                  ),
                  ButtonWidget(
                    child: Text(translate('help.continue')),
                    size: Size(70.w, 6.h),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
