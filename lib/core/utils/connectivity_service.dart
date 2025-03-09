import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> checkConnection() async {
    try {
      final dynamic rawResult = await _connectivity.checkConnectivity();
      ConnectivityResult result;

      if (rawResult is ConnectivityResult) {
        result = rawResult;
      } else if (rawResult is List) {
        if (rawResult.isNotEmpty) {
          if (rawResult.first is ConnectivityResult) {
            result = rawResult.first as ConnectivityResult;
          } else if (rawResult.first is String) {
            result = _parseConnectivityResult(rawResult.first as String);
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else if (rawResult is String) {
        result = _parseConnectivityResult(rawResult);
      } else {
        return false;
      }

      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  static ConnectivityResult _parseConnectivityResult(String result) {
    switch (result.toLowerCase()) {
      case 'wifi':
        return ConnectivityResult.wifi;
      case 'mobile':
        return ConnectivityResult.mobile;
      case 'ethernet':
        return ConnectivityResult.ethernet;
      case 'bluetooth':
        return ConnectivityResult.bluetooth;
      default:
        return ConnectivityResult.none;
    }
  }
}
