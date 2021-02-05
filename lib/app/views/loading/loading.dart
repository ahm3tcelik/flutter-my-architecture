import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/example_service/IExampleService.dart';
import 'package:template/app/services/user_service/IUserService.dart';


class LoadingView extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final container = KiwiContainer();

  @override
  Widget build(BuildContext context) {

    final IUserService userService = container<IUserService>();
    final IExampleService exampleService = container<IExampleService>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My architecture'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      final newId = await userService.localAdd(
                          User(userName: nameCtrl.text));
                      print("User | Yeni Kayıt ID: " + newId.toString());

                      final newId2 = await exampleService.localAdd(
                          Example(exampleData: nameCtrl.text));
                      print("Example | Yeni Kayıt ID: " + newId2.toString());
                    },
                    child: Text("Write"),
                    color: Theme
                        .of(context)
                        .buttonColor,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      final result = await userService.localGetAll();
                      result.fold((l) => print(l.message), (r) =>
                          r.forEach((u) {
                            print('User | # ${u.userId.toString()} ${u.userName}');
                          })
                      );

                      final result2 = await exampleService.localGetAll();
                      result2.fold((l) => print(l.message), (r) =>
                          r.forEach((u) {
                            print('Example | # ${u.exampleId.toString()} ${u.exampleData}');
                          })
                      );
                    },
                    child: Text("Get Data"),
                    color: Theme
                        .of(context)
                        .buttonColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox())
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Loading...')),
    );
  }
}
