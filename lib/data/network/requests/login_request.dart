import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/data/models/verify_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/verify_response.dart';

const verifyPhoneUrl = '/verifyPhone';
const otpUrl = '/otp';

class LoginRequest {
  static Future<LoginResponseModel> login(
      LoginRequestModel requestModel) async {
    final response = await DioHelper.postData(
        url: verifyPhoneUrl, body: requestModel.tojson());
    if (response.data['status'] == 200) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.data['message']);
    }
  }

  static Future<VerifyResponseModel> verifyPhone(
      VerifyRequestModel requestModel) async {
    final response =
        await DioHelper.postData(url: otpUrl, body: requestModel.tojson());
    if (response.data['status'] == 200) {
      return VerifyResponseModel.fromJson(response.data);
    } else {
      throw Exception(response.data['message']);
    }
  }
}
