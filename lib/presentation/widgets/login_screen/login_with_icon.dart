import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/toast.dart';

class LoginWithIcon extends StatelessWidget {
  const LoginWithIcon({
    Key? key,
    required this.path,
    required this.title,
  }) : super(key: key);
  final String path;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        fToast.init(context);
        showToast('Log in with $title');
      },
      child: Material(
        borderRadius: BorderRadius.circular(40),
        elevation: 20,
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 26,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(path),
          ),
        ),
      ),
    );
  }
}
