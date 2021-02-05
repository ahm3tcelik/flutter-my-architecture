import 'package:kiwi/kiwi.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:template/app/data/data_sources/local/sqflite/dao_context.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';

class SqfliteDbProvider implements IDbProvider<Database> {
  static const DbName = "template_app.db";
  static const DbVersion = 1;

  final container = KiwiContainer();

  Database _db;
  bool isInitialized = false;

  @override
  Future<Database> getDb() async {
    if (!isInitialized) await init();
    return _db;
  }

  @override
  Future<void> init() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, DbName);

    _db = await openDatabase(
      path,
      version: DbVersion,
      onCreate: onCreateDb,
      onUpgrade: onUpgradeDb,
    );
  }

  void onCreateDb(Database db, int version) async {
    DaoContext.daoList.forEach((dao) {
      db.execute(dao.createTableQuery);
    });
  }

  void onUpgradeDb(Database db, int oldVersion, int newVersion) {
    DaoContext.daoList.forEach((dao) {
      db.execute('DROP TABLE IF EXISTS "${dao.tableName}"');
    });

    onCreateDb(db, newVersion);
  }
}
