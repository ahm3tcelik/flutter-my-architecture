import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/app/routes/pages.dart';
import 'package:template/injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector().setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Clean Architecture Template',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.native,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);
  }
}
