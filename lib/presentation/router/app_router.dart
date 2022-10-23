import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product_details_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/verify_otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/main_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final LoginCubit loginCubit = LoginCubit();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => loginCubit,
            child: const LoginScreen(),
          ),
        );
      case '/verify':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => loginCubit,
            child: const VerifyOtpScreen(),
          ),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductsCubit>(
            create: (context) => ProductsCubit()..getProducts(),
            child: const MainScreen(),
          ),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/product-details':
        final ProductModel product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
        );
      case '/help':
        return MaterialPageRoute(
          builder: (_) => const HelpScreen(),
        );
      default:
        return null;
    }
  }
}
