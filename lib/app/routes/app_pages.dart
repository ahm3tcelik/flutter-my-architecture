import 'package:get/get.dart';
import '../views/index.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.USERS;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
        name: AppRoutes.LOADING,
        page: () => LoadingView(),
        binding: LoadingBinding()),
    GetPage(
        name: AppRoutes.USERS,
        page: () => UsersView(),
        binding: UsersBinding()),
  ];
}
