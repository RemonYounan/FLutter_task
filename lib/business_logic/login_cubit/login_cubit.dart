import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/data/models/verify_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/verify_response.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String name, String phone) async {
    emit(LoginLoadingState());
    try {
      final requestModel = LoginRequestModel(name: name, phone: phone);
      final response = await LoginRequest.login(requestModel);
      emit(LoginSuccessState(responseModel: response));
    } catch (error) {
      emit(LoginErrorState(message: error.toString()));
    }
  }

  Future<void> verifyPhone(String code) async {
    emit(LoginLoadingState());
    try {
      final requestModel = VerifyRequestModel(code: code, phone: '01111111111');
      final response = await LoginRequest.verifyPhone(requestModel);
      CacheHelper.saveDataSharedPreference(key: 'IS-LOGGED-IN', value: true);
      emit(VerifySuccessState(responseModel: response));
    } catch (error) {
      emit(LoginErrorState(message: error.toString()));
    }
  }
}
