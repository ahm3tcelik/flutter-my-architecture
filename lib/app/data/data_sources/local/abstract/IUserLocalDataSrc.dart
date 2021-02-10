import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/ILocalDataSource.dart';

abstract class IUserLocalDataSrc extends ILocalDataSource<User> {
  // Special methods other than CRUD
  // CRUD methods are inherited

  Future<List<User>> searchByName(String key);

}
