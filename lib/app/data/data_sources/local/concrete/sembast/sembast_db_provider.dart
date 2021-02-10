import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:template/app/resources/constants/db_constants.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';

class SembastDbProvider extends IDbProvider<Database> {

  Completer<Database> _dbOpenCompleter;

  @override
  Future<Database> getDb() async {
    if (_dbOpenCompleter == null) {
    _dbOpenCompleter = Completer();
    _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {

    final appDocumentDir = await getApplicationDocumentsDirectory();

    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, DbConstants.Name);

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

}