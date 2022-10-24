// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDisposeControllers: false,
      autoFocus: true,
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      boxShadows: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.25),
          blurRadius: 20,
          offset: const Offset(2, 5),
        )
      ],
      cursorColor: AppColors.blue.withOpacity(.72),
      textStyle: const TextStyle(color: AppColors.blue),
      pinTheme: PinTheme(
        inactiveColor: Colors.white,
        selectedColor: Colors.white,
        activeColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15),
        fieldHeight: 80,
        fieldWidth: 70,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      controller: textEditingController,
      onChanged: onChanged,
    );
  }
}
