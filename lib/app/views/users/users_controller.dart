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
  String usersErrorMsg = '';

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
    if (usersViewState.value == ViewState.busy) return;
    localUsersView = false;
    _setUsersViewState(ViewState.busy);
    final result = await userService.remoteGetAllUsers();
    _handleFetchUsers(result);
  }

  void localFetchUsers() async {
    if (usersViewState.value == ViewState.busy) return;
    localUsersView = true;
    _setUsersViewState(ViewState.busy);
    final result = await userService.localGetAll();
    _handleFetchUsers(result);
  }

  void _handleFetchUsers(Either<Failure, List<User>> result) async {
    result.fold((failure) {
      _users?.clear();
      usersErrorMsg = failure.message;
      _setUsersViewState(ViewState.error);
    }, (data) {
      _users = data;

      Get.snackbar(
          "Data", "Data received from ${localUsersView ? 'local db' : 'api'}");

      _setUsersViewState(ViewState.data);
    });
  }

  _setUsersViewState(ViewState state) {
    usersViewState.value = state;
  }
}
