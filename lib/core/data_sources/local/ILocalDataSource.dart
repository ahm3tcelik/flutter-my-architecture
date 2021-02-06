import 'package:template/core/models/IEntity.dart';

abstract class ILocalDataSource<T extends IEntity> {

  Future<T> get(dynamic id);
  Future<List<T>> getAll();
  Future<int> add(T ent);
  Future<int> update(dynamic id, T ent);
  Future<int> delete(dynamic id, T ent);
  Future<void> putFromRemote(List<T> entList);
}