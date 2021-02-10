import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/sembast/ISembastDao.dart';

class UserSembastDao extends ISembastDao<User> {

  @override
  User get createGenericInstance => User();

  @override
  String get mainStoreRef => 'Users';

  @override
  String get primaryKey => 'userId';

}