import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/user_service/IUserService.dart';


class LoadingView extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final container = KiwiContainer();

  @override
  Widget build(BuildContext context) {

    final IUserService userService = container<IUserService>();

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(hintText: "Name"),
          ),
          RaisedButton(
            onPressed: () async {
              final newId = await userService.localAdd(
                  User(userName: nameCtrl.text));
              print("Yeni Kayıt ID: " + newId.toString());
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
                    print('# ${u.userId.toString()} ${u.userName}');
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
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Loading...')),
    );
  }
}
