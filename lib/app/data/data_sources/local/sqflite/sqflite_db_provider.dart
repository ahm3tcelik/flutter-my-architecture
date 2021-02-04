import 'package:kiwi/kiwi.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_dao.dart';
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
    db.execute(container<UserDao>().createTableQuery);
    print(container<UserDao>().tableName + " oluşturuldu");
  }

  void onUpgradeDb(Database db, int oldVersion, int newVersion) {
    db.execute('DROP TABLE IF EXISTS "${container<UserDao>().tableName}"');
    onCreateDb(db, newVersion);
  }
}
