import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class VerifyResponseModel {
  final Account account;

  VerifyResponseModel({required this.account});

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyResponseModel(account: Account.fromJson(json['account']));
  }
}
