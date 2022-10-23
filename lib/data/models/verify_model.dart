class VerifyRequestModel {
  final String code;
  final String phone;

  VerifyRequestModel({
    required this.code,
    required this.phone,
  });

  Map<String, dynamic> tojson() {
    Map<String, dynamic> map = {
      'code': code,
      'phone': phone,
    };
    return map;
  }
}
