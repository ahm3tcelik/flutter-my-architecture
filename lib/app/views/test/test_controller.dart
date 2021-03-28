import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import '../../../core/utils/network/INetworkInfo.dart';
import '../../../core/enums/view_state.dart';


class TestController extends GetxController {
  final container = KiwiContainer();

  final viewState = ViewState.INITIAL.obs;
  final connectivityResult = ConnectivityResult.none.obs;

  INetworkInfo? networkInfo;

  late StreamSubscription<ConnectivityResult> connectionSubscription;

  @override
  void onInit() async {
    networkInfo = container<INetworkInfo>();
    connectivityResult.value = await networkInfo!.connectivityResult;

    connectionSubscription = networkInfo!.onConnectivityChanged.listen((result) {
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
    _setViewState(ViewState.BUSY);
    await Future.delayed(Duration(seconds: 3));
    _setViewState(ViewState.ERROR);
  }

  void getData() async {
    _setViewState(ViewState.BUSY);
    await Future.delayed(Duration(seconds: 3));
    _setViewState(ViewState.DATA);
  }

  void _setViewState(ViewState state) {
    viewState.value = state;
  }
}
