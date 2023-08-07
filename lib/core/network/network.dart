// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkCheaker {
  Future<bool> check();
}

class NetworkCheckerInternetConnectionChecker extends NetworkCheaker {
  InternetConnectionChecker internetConnectionChecker;
  NetworkCheckerInternetConnectionChecker({
    required this.internetConnectionChecker,
  });
  @override
  Future<bool> check() async {
    bool isConnected = await internetConnectionChecker.hasConnection;
    return isConnected;
  }
}
