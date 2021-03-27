import 'package:template/app/data/models/user.dart';

class UserFakeData {
  static final users = <User> [
    User(userId: '1', userName: 'ahmet'),
    User(userId: '2', userName: 'mehmet'),
    User(userId: '3', userName: 'ali'),
    User(userId: '4', userName: 'veli'),
    User(userId: '5', userName: 'ayşe'),
  ];

  static const String users_json = '[{"userId":"1","userName":"ahmet"},{"userId":"2","userName":"mehmet"},{"userId":"3","userName":"ali"},{"userId":"4","userName":"veli"},{"userId":"5","userName":"ayşe"}]';
  static const String user_json = '{"userId":"1","userName":"ahmet"}';
}