import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_assets.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
      (_) async {
        // Checking if the user is logged in or not.
        if (await checkIfLoggedIn()) {
          // If he is logged in navigate to the main screen
          Navigator.of(context).pushReplacementNamed('/main');
        } else {
          // If not navigate to login screen.
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
    );
  }

  Future<bool> checkIfLoggedIn() async {
    return await BlocProvider.of<GlobalCubit>(context).checkIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.blue,
          image: DecorationImage(
            image: AssetImage(AppAssets.splashScreen),
          ),
        ),
        child: Center(
          child: Image.asset(
            AppAssets.splashScreenLogo,
            height: 25.h,
            width: 60.w,
          ),
        ),
      ),
    );
  }
}
