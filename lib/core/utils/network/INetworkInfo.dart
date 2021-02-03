import 'dart:core';

import 'package:connectivity/connectivity.dart';

abstract class INetworkInfo {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}