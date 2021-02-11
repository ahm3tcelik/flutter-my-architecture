import 'package:sembast/sembast.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/IDao.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sembast/ISembastDao.dart';
import 'package:template/core/data_sources/local/sembast/base_sembast_data_source.dart';

import '../../../abstract/IUserLocalDataSrc.dart';

class UserSembastDataSource extends BaseSembastDataSource<User>
    implements IUserLocalDataSrc {
  const UserSembastDataSource(
      IDbProvider<Database> dbProvider, ISembastDao<User> dao)
      : super(dbProvider, dao);

  // Special methods other than CRUD
  // CRUD methods are inherited

  @override
  Future<List<User>> searchByName(String key) async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    final finder = Finder(filter: Filter.matches('userName', key));
    final result = await folder.find(await dbProvider.getDb(), finder: finder);

    return result.map((e) => User.fromJson(e.value)).toList();
  }
}
