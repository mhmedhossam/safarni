// `lib/core/network/network_info.dart`
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    List<ConnectivityResult> result = await (Connectivity()
        .checkConnectivity());
    // ignore: unrelated_type_equality_checks
    return result != ConnectivityResult.none;
  }
}
