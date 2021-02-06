import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/views/users/users_controller.dart';
import 'package:template/core/widgets/index.dart' as coreWidgets;

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
      switch (controller.usersViewState.value) {
        case ViewState.initial:
          return Text('Initial');
        case ViewState.busy:
          return buildShimmerList;
        case ViewState.data:
          return buildUsersList;
        case ViewState.error:
          return Center(child: Icon(Icons.warning, color: Get.theme.errorColor));
        default:
          return SizedBox();
      }
    });
  }

  Widget get buildShimmerList {
    return ListView(
      children: [
        for (var i = 0; i < 6; i++)
          coreWidgets.Shimmer.fromColors(
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
              baseColor: Get.theme.backgroundColor,
              highlightColor: Get.theme.highlightColor)
      ],
    );
  }

  Widget get buildUsersList {
    return ListView(
      children: [
        for (User user in controller.users)
          ListTile(
            title: Text(user.userName),
            leading: CircleAvatar(
              child: Text(user.userId.toString()),
            ),
          )
      ],
    );
  }
}