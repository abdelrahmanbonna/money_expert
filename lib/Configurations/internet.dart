import 'package:connectivity/connectivity.dart';

class Internet {
  static Future<ConnectionStatus> hasConnection() async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi)
        ? ConnectionStatus.hasConnection
        : ConnectionStatus.noConnection;
  }
}

enum ConnectionStatus { hasConnection, noConnection }
