import '../../../../../../data/models/user.dart';
import '../../../../../../../core/data_sources/local/sqflite/ISqfliteDao.dart';

class UserSqfliteDao extends ISqfliteDao<User> {

  @override
  User get createGenericInstance => User();

  @override
  String get createTableQuery =>
      ''' CREATE TABLE "Users" ( "userId"	TEXT, "userName"	TEXT); ''';

  // User user = User();
  // user.userId;
  // for example primary kes is 'userId'
  @override
  String get primaryKey => 'userId';

  // tableName must be same as createTableQuery's table name
  @override
  String get tableName => 'Users';
}
