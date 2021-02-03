import 'package:connectivity/connectivity.dart';

import 'INetworkInfo.dart';

class NetworkInfo implements INetworkInfo {
  final Connectivity connectivity;

  const NetworkInfo(this.connectivity);

  @override
  Future<ConnectivityResult> get connectivityResult =>
      connectivity.checkConnectivity();

  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
