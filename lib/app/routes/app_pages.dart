import 'package:get/get.dart';

import '../views/index.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.LOADING;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
    ),
    GetPage(name: AppRoutes.LOADING, page: () => LoadingView()),
  ];
}