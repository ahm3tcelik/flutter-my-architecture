import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/enums/view_state.dart';
import '../../../core/errors/failure.dart';
import '../../../core/models/either.dart';
import '../../../core/utils/network/INetworkInfo.dart';
import '../../data/models/user.dart';
import '../../services/user_service/IUserService.dart';

class UsersController extends GetxController {
  final container = KiwiContainer();

  final connectivityResult = ConnectivityResult.none.obs;
  INetworkInfo? networkInfo;
  late StreamSubscription<ConnectivityResult> connectionSubscription;

  late final IUserService userService = container<IUserService>();
  final usersViewState = ViewState.INITIAL.obs;

  List<User>? users;
  String usersErrorMsg = '';
  bool localUsersView = false;

  @override
  void onInit() async {
    networkInfo = container<INetworkInfo>();
    connectivityResult.value = await networkInfo!.connectivityResult;

    connectionSubscription =
        networkInfo!.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none &&
          (users == null || users!.isEmpty || localUsersView)) {
        _remoteFetchUsers();
      }
      connectivityResult.value = result;
    });

    if (await networkInfo!.isConnected())
      _remoteFetchUsers();
    else
      _localFetchUsers();

    super.onInit();
  }

  @override
  void onClose() {
    usersViewState.close();
    connectionSubscription.cancel();
    super.onClose();
  }

  void _remoteFetchUsers() async {
    if (usersViewState.value == ViewState.BUSY) return;
    localUsersView = false;
    _setUsersViewState(ViewState.BUSY);
    final result = await userService.remoteGetAllUsers();
    _handleFetchUsers(result);
  }

  void _localFetchUsers() async {
    if (usersViewState.value == ViewState.BUSY) return;
    localUsersView = true;
    _setUsersViewState(ViewState.BUSY);
    final Either<Failure, List<User>> result = await userService.localGetAll();
    _handleFetchUsers(result);
  }

  void _handleFetchUsers(Either<Failure, List<User>> result) async {
    result.fold(onLeft: (failure) {
      // ON ERROR
      users?.clear();
      usersErrorMsg = failure?.message ?? 'Error';
      _setUsersViewState(ViewState.ERROR);
    }, onRight: (data) {
      // ON SUCCESS
      users = data;
      Get.snackbar(
          "Data", "Data received from ${localUsersView ? 'local db' : 'api'}");
      _setUsersViewState(ViewState.DATA);
    });
  }

  _setUsersViewState(ViewState state) {
    usersViewState.value = state;
  }
}
