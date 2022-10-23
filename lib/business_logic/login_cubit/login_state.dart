part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponseModel responseModel;
  LoginSuccessState({
    required this.responseModel,
  });
}
class VerifySuccessState extends LoginState {
  final VerifyResponseModel responseModel;
  VerifySuccessState({
    required this.responseModel,
  });
}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({
    required this.message,
  });
}
