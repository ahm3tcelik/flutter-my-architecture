abstract class ILocalDataSource<T> {

  Future<T> get(int id);
  Future<List<T>> getAll();
  Future<int> add(T ent);
  Future<int> update(int id, T ent);
  Future<int> delete(int id, T ent);
}