import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/app/resources/translations/app_translation.dart';
import 'package:template/app/routes/app_pages.dart';
import 'package:template/injector/injector.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotEnv;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotEnv.load(); // this line must be above the injector
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
        translationsKeys: AppTranslation.translations,
        locale: Get.deviceLocale,
        defaultTransition: Transition.native,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);
  }

}
