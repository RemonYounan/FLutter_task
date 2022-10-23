import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/help_screen/help_item_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/loading_widget.dart';
import 'package:sizer/sizer.dart';

class HelpItemsListWidget extends StatelessWidget {
  const HelpItemsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return SizedBox(
            height: 55.h,
            child: LoadingWidget(
              color: AppColors.blue.withOpacity(0.85),
            ),
          );
        } else if (state is HelpListLoadedState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.helpList.length,
            itemBuilder: (context, index) {
              return HelpItemWidget(
                question: state.helpList[index].question,
                answer: state.helpList[index].answer,
                initiallyExpanded: index == 0,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
