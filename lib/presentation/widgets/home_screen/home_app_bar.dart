import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.5.h,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: AppColors.grey,
                  ),
                ),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 7.5.h,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.filter_alt_rounded,
                  color: AppColors.grey,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
