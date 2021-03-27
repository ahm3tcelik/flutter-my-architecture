import 'package:get/get.dart';
import '../users/users_controller.dart';

class UsersBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<UsersController>(
          () => UsersController(),
    );
  }
}