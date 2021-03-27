import '../../../../core/data_sources/local/IDao.dart';
import '../../../../core/data_sources/local/IDbProvider.dart';
import '../../../../core/data_sources/local/ILocalDataSource.dart';
import '../../../../core/models/IEntity.dart';
import 'ISqfliteDao.dart';

class BaseSqfliteDataSource<T extends IEntity<T>>
    implements ILocalDataSource<T> {
  final IDbProvider<dynamic> dbProvider;
  final IDao<T> dao;

  const BaseSqfliteDataSource(this.dbProvider, this.dao);

  @override
  Future<int> add(T ent) async {
    final db = await dbProvider.getDb();
    final result = await db.insert((dao as ISqfliteDao).tableName, ent.toJson());
    return result;
  }

  @override
  Future<int> delete(dynamic id, T ent) async {
    final db = await dbProvider.getDb();
    final result = await db.delete((dao as ISqfliteDao).tableName,
        whereArgs: [dao.primaryKey], where: '${dao.primaryKey} = $id');

    return result;
  }

  @override
  Future<T>? get(dynamic id) async {
    final db = await dbProvider.getDb();
    final results = await db.query((dao as ISqfliteDao).tableName,
        distinct: true,
        limit: 1,
        whereArgs: [dao.primaryKey],
        where: '${dao.primaryKey} = $id');

    return dao.createGenericInstance.fromJson(results.first);
  }

  @override
  Future<List<T>>? getAll() async {
    final db = await dbProvider.getDb();
    final results = await db.query((dao as ISqfliteDao).tableName);
    final resultsAsList =
        results.map((e) => dao!.createGenericInstance.fromJson(e)).toList();
    return resultsAsList;
  }

  @override
  Future<int> update(dynamic id, T ent) async {
    final db = await dbProvider.getDb();
    final result = await db.update((dao as ISqfliteDao).tableName, ent.toJson(),
        whereArgs: [dao.primaryKey], where: '${dao.primaryKey} = $id');
    return result;
  }

  @override
  Future<void> putFromRemote(List<T> entList) async {
    final db = await dbProvider.getDb();

    db.delete((dao as ISqfliteDao).tableName);

    final batch = db.batch();
    entList.forEach((ent) {
      batch.insert((dao as ISqfliteDao).tableName, ent.toJson());
    });
    await batch.commit(noResult: true);
  }
}
