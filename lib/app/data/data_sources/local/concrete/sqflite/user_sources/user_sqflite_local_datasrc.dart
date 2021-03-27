import '../../../../../../../app/data/data_sources/local/abstract/IUserLocalDataSrc.dart';
import '../../../../../../../app/data/models/user.dart';
import '../../../../../../../core/data_sources/local/IDao.dart';
import '../../../../../../../core/data_sources/local/IDbProvider.dart';
import '../../../../../../../core/data_sources/local/sqflite/ISqfliteDao.dart';
import '../../../../../../../core/data_sources/local/sqflite/base_sqflite_data_source.dart';

class UserSqfliteDataSource extends BaseSqfliteDataSource<User>
    implements IUserLocalDataSrc {
  UserSqfliteDataSource(IDbProvider<dynamic> dbProvider, IDao<User> dao)
      : super(dbProvider, dao);

  @override
  Future<List<User>> searchByName(String key) async {
    final db = await dbProvider.getDb();
    var results = await db.query((dao as ISqfliteDao).tableName,
        whereArgs: ["userName"], where: "userName LIKE '%$key%'");
    var resultsAsList = results.map((e) => User.fromJson(e)).toList();
    return resultsAsList;
  }
}
