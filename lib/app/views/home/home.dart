import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/app/routes/app_routes.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: Get.width / 2,
          height: Get.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.TEST);
                },
                child: Text('Test UI'),
              ),
              RaisedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.USERS);
                },
                child: Text('Users Page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
