import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class MoreDetailsWidget extends StatefulWidget {
  const MoreDetailsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  State<MoreDetailsWidget> createState() => _MoreDetailsWidgetState();
}

class _MoreDetailsWidgetState extends State<MoreDetailsWidget> {
  int currentIndex = 0;
  final optionsList = ['Overview', 'Spesification', 'Review'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            optionsList.length,
            (index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Text(
                      optionsList[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: index == currentIndex
                                ? AppColors.lightBlack
                                : AppColors.grey,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Visibility(
                      visible: index == currentIndex,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.blue,
                                  AppColors.blue.withOpacity(0.4),
                                ])),
                      ))
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          widget.product.description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
              ),
        )
      ],
    );
  }
}
