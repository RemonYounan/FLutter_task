import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class HelpItemWidget extends StatelessWidget {
  const HelpItemWidget({
    Key? key,
    required this.question,
    required this.answer,
    required this.initiallyExpanded,
  }) : super(key: key);
  final String question;
  final String answer;
  final bool initiallyExpanded;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ExpansionTile(
            backgroundColor: AppColors.white,
            collapsedBackgroundColor: AppColors.white,
            tilePadding: EdgeInsets.symmetric(horizontal: 3.w),
            childrenPadding:
                EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.h),
            initiallyExpanded: initiallyExpanded,
            title: Text(
              question,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.blue),
            ),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  answer,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
