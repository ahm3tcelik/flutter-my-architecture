import 'package:get/get.dart';
import '../views/index.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
        name: AppRoutes.TEST,
        page: () => TestView(),
        binding: TestBinding()),
    GetPage(
        name: AppRoutes.USERS,
        page: () => UsersView(),
        binding: UsersBinding()),
  ];
}
