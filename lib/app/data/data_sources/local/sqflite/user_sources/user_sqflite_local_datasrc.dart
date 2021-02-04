import 'package:sqflite/sqflite.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/IUserLocalDataSrc.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';
import 'package:template/core/data_sources/local/sqflite/base_sqflite_data_source.dart';

class UserSqfliteDataSource extends BaseSqfliteDataSource<User>
    implements IUserLocalDataSrc {
  UserSqfliteDataSource(IDbProvider<Database> dbProvider, IDao<User> dao)
      : super(dbProvider, dao);

  @override
  Future<List<User>> searchByName(String key) async {
    final db = await dbProvider.getDb();
    var results = await db.query(dao.tableName,
        whereArgs: ["userName"], where: "userName LIKE '%$key%'");
    var resultsAsList = results.map((e) => User.fromJson(e)).toList();
    return resultsAsList;
  }
}
