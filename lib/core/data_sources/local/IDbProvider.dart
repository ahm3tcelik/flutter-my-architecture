abstract class IDbProvider<TDatabase> {
  Future<TDatabase> getDb();

  Future<void> init();
}
