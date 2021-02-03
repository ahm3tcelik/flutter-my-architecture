abstract class IDbProvider<Database> {
  Future<Database> getDb();

  Future<void> init();
}
