// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      required this.hintText,
      this.keyboardType,
      required this.validator,
      required this.controller,
      this.textInputAction})
      : super(key: key);

  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Material(
        elevation: 10,
        shadowColor: AppColors.black,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 10.sp,
            ),
          ),
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: TextStyle(fontSize: 12.sp),
        ),
      ),
    );
  }
}
