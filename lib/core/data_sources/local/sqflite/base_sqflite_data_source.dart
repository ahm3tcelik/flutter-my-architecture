import 'package:template/app/data/data_sources/local/sqflite/sqflite_db_provider.dart';
import 'package:template/core/data_sources/local/ILocalDataSource.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';
import 'package:template/core/models/IEntity.dart';

class BaseSqfliteDataSource<T extends IEntity<T>>
    implements ILocalDataSource<T> {
  final SqfliteDbProvider dbProvider;
  final IDao<T> dao;

  const BaseSqfliteDataSource(this.dbProvider, this.dao);

  @override
  Future<int> add(T ent) async {
    final db = await dbProvider.getDb();
    final result = await db.insert(dao.tableName, ent.toMap());
    return result;
  }

  @override
  Future<int> delete(int id, T ent) async {
    final db = await dbProvider.getDb();
    final result = await db.delete(dao.tableName,
        whereArgs: [dao.primaryKey], where: '${dao.primaryKey} = $id');

    return result;
  }

  @override
  Future<T> get(int id) async {
    final db = await dbProvider.getDb();
    final results = await db.query(dao.tableName,
        distinct: true,
        limit: 1,
        whereArgs: [dao.primaryKey],
        where: '${dao.primaryKey} = $id');

    return dao.createGenericInstance.fromMap(results.first);
  }

  @override
  Future<List<T>> getAll() async {
    final db = await dbProvider.getDb();
    final results = await db.query(dao.tableName);
    final resultsAsList =
        results.map((e) => dao.createGenericInstance.fromMap(e)).toList();
    return resultsAsList;
  }

  @override
  Future<int> update(int id, T ent) async {
    final db = await dbProvider.getDb();
    final result = await db.update(dao.tableName, ent.toMap(),
        whereArgs: [dao.primaryKey], where: '${dao.primaryKey} = $id');
    return result;
  }
}
