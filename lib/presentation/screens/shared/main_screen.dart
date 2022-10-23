import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void onTap(int index) {
    switch (index) {
      case 0:
        CacheHelper.removeData(key: 'IS-LOGGED-IN');
        Navigator.of(context).pushReplacementNamed('/login');
        break;
      case 1:
        // Do something
        break;
      case 2:
        // Do something
        break;
      case 3:
        BlocProvider.of<GlobalCubit>(context).getHelp();
        Navigator.of(context).pushNamed('/help');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.blue,
                  AppColors.blue.withOpacity(0.75),
                  AppColors.blue.withOpacity(0.3),
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
            child: const Icon(
              Icons.home,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: -1,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        notchMargin: 4,
        onTap: onTap,
        backgroundColor: AppColors.white,
        activeColor: AppColors.black,
        inactiveColor: AppColors.grey,
        iconSize: 26,
        icons: const [
          Icons.logout_rounded,
          Icons.favorite,
          Icons.notifications,
          Icons.settings,
        ],
        leftCornerRadius: 25,
        rightCornerRadius: 25,
      ),
    );
  }
}
