class LoginResponseModel {
  final String code;

  LoginResponseModel({required this.code});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(code: json['code']);
  }
}
