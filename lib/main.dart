import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:template/app/resources/translations/app_translation.dart';
import 'package:template/app/routes/app_pages.dart';
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
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        //translationsKeys: AppTranslation.translations,
        defaultTransition: Transition.native,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);
  }

}
