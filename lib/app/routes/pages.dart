import 'package:get/get.dart';

import '../views/index.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = Routes.LOADING;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(name: Routes.LOADING, page: () => LoadingView()),
  ];
}
