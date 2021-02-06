import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';

enum ViewState { initial, busy, error, data }

class LoadingController extends GetxController {
  final container = KiwiContainer();

  final viewState = ViewState.initial.obs;
  final connectivityResult = ConnectivityResult.none.obs;

  INetworkInfo networkInfo;

  StreamSubscription<ConnectivityResult> connectionSubscription;

  @override
  void onInit() async {
    networkInfo = container<INetworkInfo>();
    connectivityResult.value = await networkInfo.connectivityResult;

    connectionSubscription = networkInfo.onConnectivityChanged.listen((result) {
      connectivityResult.value = result;
    });
    super.onInit();
  }

  @override
  void onClose() {
    viewState.close();
    connectionSubscription.cancel();
    super.onClose();
  }

  void getError() async {
    _setViewState(ViewState.busy);
    await Future.delayed(Duration(seconds: 3));
    _setViewState(ViewState.error);
  }

  void getData() async {
    _setViewState(ViewState.busy);
    await Future.delayed(Duration(seconds: 3));
    _setViewState(ViewState.data);
  }

  void _setViewState(ViewState state) {
    viewState.value = state;
  }
}
