import 'package:get/get.dart';
import 'package:template/app/views/loading/loading_controller.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingController>(
      () => LoadingController(),
    );
  }
}
