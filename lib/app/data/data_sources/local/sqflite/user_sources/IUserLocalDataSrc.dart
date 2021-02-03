import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/ILocalDataSource.dart';


abstract class IUserLocalDataSrc extends ILocalDataSource<User> {
  Future<List<User>> searchByName(String key);
}