import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.color, Key? key}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.white,
      ),
    );
  }
}
