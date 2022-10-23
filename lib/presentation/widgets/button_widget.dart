import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.child,
    required this.size,
    this.borderRadius,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Size size;
  final double? borderRadius;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 50),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.blue,
            AppColors.blue.withOpacity(.5),
            AppColors.blue.withOpacity(.23),
          ],
          stops: const [0.0, 0.99, 1.0],
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.white,
          shadowColor: Colors.transparent,
          fixedSize: size,
          textStyle: Theme.of(context).textTheme.titleMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
