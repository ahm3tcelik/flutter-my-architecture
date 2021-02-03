import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';


class UserDao extends IDao<User> {

  @override
  User get createGenericInstance => User();

  @override
  String get createTableQuery =>
      ''' CREATE TABLE "Users" ( "userId"	INTEGER PRIMARY KEY AUTOINCREMENT, "userName"	TEXT); ''';

  // User user = User();
  // user.userId;
  // for example primary kes is 'userId'
  @override
  String get primaryKey => 'userId';

  // tableName must be same as createTableQuery's table name
  @override
  String get tableName => 'Users';
}
