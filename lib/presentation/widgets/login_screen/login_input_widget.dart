import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/button_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/loading_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/text_form_field_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class LoginInputWidget extends StatefulWidget {
  const LoginInputWidget({Key? key}) : super(key: key);

  @override
  State<LoginInputWidget> createState() => _LoginInputWidgetState();
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      context
          .read<LoginCubit>()
          .login(_nameController.text, _phoneController.text);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(6.w, 1.h, 6.w, 0),
            child: Column(
              children: [
                Text(
                  translate('login.title'),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 1.h),
                Divider(
                  color: AppColors.blue.withOpacity(.72),
                  thickness: 2.sp,
                  endIndent: 20.w,
                  indent: 20.w,
                ),
                SizedBox(height: 3.h),
                TextFormFieldWidget(
                  hintText: translate('login.text1'),
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return translate('login.error1');
                    }
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 2.h),
                TextFormFieldWidget(
                  hintText: translate('login.text2'),
                  controller: _phoneController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return translate('login.error2');
                    }
                  },
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 3.h),
                ButtonWidget(
                  child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.of(context).pushNamed('/verify');
                      } else if (state is LoginErrorState) {
                        fToast.init(context);
                        showToast(state.message.replaceRange(0, 11, ''));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const LoadingWidget();
                      } else {
                        return Text(translate('login.button'));
                      }
                    },
                  ),
                  size: Size(68.w, 6.h),
                  onPressed: submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
