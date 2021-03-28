import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/user.dart';
import '../users/users_controller.dart';
import '../../../core/widgets/index.dart' as CoreWidgets;

class UsersView extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Page'),
        centerTitle: true,
      ),
      body: buildUsersView,
    );
  }

  Widget get buildUsersView {
    return Obx(() {
      return CoreWidgets.Folded(
        viewState: controller.usersViewState.value,
        busy: _buildShimmerList,
        error: _buildError,
        data: _buildUsersList,
      );
    });
  }

  Widget get _buildError {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, color: Get.theme!.errorColor, size: 48),
          Text(controller.usersErrorMsg)
        ],
      ),
    );
  }

  Widget get _buildShimmerList {
    return ListView(
      children: [
        for (var i = 0; i < 6; i++)
          CoreWidgets.Shimmer.fromColors(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(""),
                ),
                title: Container(
                  color: Colors.white,
                  child: SizedBox(height: 7),
                ),
                subtitle: Container(
                  color: Colors.white,
                  child: SizedBox(height: 7,),
                ),
              ).paddingAll(8),
              baseColor: Get.theme!.backgroundColor,
              highlightColor: Get.theme!.highlightColor)
      ],
    );
  }

  Widget get _buildUsersList {
    return ListView(
      children: [
        for (User user in controller.users ?? [])
          ListTile(
            title: Text(user.userName!),
            leading: CircleAvatar(
              child: Text(user.userId.toString()),
            ),
          )
      ],
    );
  }
}
