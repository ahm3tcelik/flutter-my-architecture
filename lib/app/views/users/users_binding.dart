import 'package:get/get.dart';
import 'package:template/app/views/users/users_controller.dart';

class UsersBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<UsersController>(
          () => UsersController(),
    );
  }
}