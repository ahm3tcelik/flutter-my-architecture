import 'package:sembast/sembast.dart';
import 'package:template/core/data_sources/local/IDao.dart';
import 'package:template/core/data_sources/local/sembast/ISembastDao.dart';
import 'package:template/core/models/IEntity.dart';
import '../IDbProvider.dart';
import '../ILocalDataSource.dart';

class BaseSembastDataSource<T extends IEntity<T>>
    implements ILocalDataSource<T> {
  final IDbProvider<Database> dbProvider;

  const BaseSembastDataSource(this.dbProvider, this.dao);

  final IDao<T> dao;

  @override
  Future<int> add(T ent) async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    final result = await folder.add(await dbProvider.getDb(), ent.toJson());
    return result;
  }

  @override
  Future<int> delete(id, T ent) async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    final finder = Finder(filter: Filter.equals(dao.primaryKey, id));
    final result =
        await folder.delete(await dbProvider.getDb(), finder: finder);
    return result;
  }

  @override
  Future<T> get(id) async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    final finder = Finder(filter: Filter.equals(dao.primaryKey, id));
    final result =
        await folder.findFirst(await dbProvider.getDb(), finder: finder);
    return dao.createGenericInstance.fromJson(result.value);
  }

  @override
  Future<List<T>> getAll() async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    final result = await folder.find(await dbProvider.getDb());

    return result
        .map((e) => dao.createGenericInstance.fromJson(e.value))
        .toList();
  }

  @override
  Future<void> putFromRemote(List<T> entList) async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    folder.delete(await dbProvider.getDb());
    folder.addAll(await dbProvider.getDb(), entList.map((e) => e.toJson()).toList());
  }

  @override
  Future<int> update(id, T ent) async {
    final folder = intMapStoreFactory.store((dao as ISembastDao).mainStoreRef);
    final finder = Finder(filter: Filter.equals(dao.primaryKey, id));
    final result = await folder.update(await dbProvider.getDb(), ent.toJson(),
        finder: finder);
    return result;
  }
}
