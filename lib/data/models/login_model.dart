class LoginRequestModel {
  final String name;
  final String phone;

  LoginRequestModel({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'phone': phone,
    };
   
  }
}
