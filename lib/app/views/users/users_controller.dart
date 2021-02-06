import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/core/errors/failure.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';

enum ViewState { initial, busy, error, data }

class UsersController extends GetxController {
  final container = KiwiContainer();

  final connectivityResult = ConnectivityResult.none.obs;
  INetworkInfo networkInfo;
  StreamSubscription<ConnectivityResult> connectionSubscription;

  IUserService userService;
  final usersViewState = ViewState.initial.obs;
  List<User> _users;

  List<User> get users => List.from(_users);
  bool localUsersView = false;

  @override
  void onInit() async {
    userService = container<IUserService>();

    networkInfo = container<INetworkInfo>();
    connectivityResult.value = await networkInfo.connectivityResult;

    connectionSubscription =
        networkInfo.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none &&
          (_users == null || _users.isEmpty || localUsersView)) {
        remoteFetchUsers();
      }
      connectivityResult.value = result;
    });

    if (await networkInfo.isConnected())
      remoteFetchUsers();
    else
      localFetchUsers();

    super.onInit();
  }

  @override
  void onClose() {
    usersViewState.close();
    connectionSubscription.cancel();
    super.onClose();
  }

  void remoteFetchUsers() async {
    localUsersView = false;
    _setUsersViewState(ViewState.busy);
    await Future.delayed(Duration(seconds: 5));
    _setUsersViewState(ViewState.error);
  }

  void localFetchUsers() async {
    localUsersView = true;
    if (usersViewState.value == ViewState.busy) return;

    _setUsersViewState(ViewState.busy);
    final result = await userService.localGetAll();
    handleFetchUsers(result);
  }

  void handleFetchUsers(Either<Failure, List<User>> result) async {
    result.fold((failure) {
      _users?.clear();
      _setUsersViewState(ViewState.error);
    }, (data) {
      _users = data;
      _setUsersViewState(ViewState.data);
    });
  }

  _setUsersViewState(ViewState state) {
    usersViewState.value = state;
  }
}
