import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/button_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/loading_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/pin_code_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late TextEditingController textEditingController;
  String currentText = '';
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.blue.withOpacity(.85),
                AppColors.blue.withOpacity(0),
              ],
              stops: const [0.0, 0.65],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    translate('verify.title'),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  PinCodeWidget(
                      textEditingController: textEditingController,
                      onChanged: (value) {
                        setState(() {
                          currentText = value;
                        });
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextButton(
                    onPressed: () {
                      fToast.init(context);
                      showToast('Code has been sent again to your number');
                    },
                    child: Text(
                      translate('verify.resend'),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  ButtonWidget(
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is VerifySuccessState) {
                            Navigator.of(context).pushReplacementNamed('/main');
                          } else if (state is LoginErrorState) {
                            fToast.init(context);
                            showToast(state.message.replaceRange(0, 11, ''));
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return const LoadingWidget();
                          }
                          return Text(translate('verify.button'));
                        },
                      ),
                      size: Size(80.w, 7.h),
                      onPressed: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        BlocProvider.of<LoginCubit>(context)
                            .verifyPhone(currentText);
                      }),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
