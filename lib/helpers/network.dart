import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Network {
  bool _isConnected = false;

  bool get isConnected {
    return _isConnected;
  }

  void checkConnection() async {
    _isConnected = await InternetConnectionCheckerPlus().hasConnection;
  }
}
