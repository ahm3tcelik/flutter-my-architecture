import '../../../../../../data/models/example.dart';
import '../../../../../../../core/data_sources/local/sqflite/ISqfliteDao.dart';

class ExampleSqfliteDao extends ISqfliteDao<Example> {

  @override
  Example get createGenericInstance => Example();

  @override
  String get createTableQuery =>
      ''' CREATE TABLE "Examples" ( "exampleId"	TEXT, "exampleData"	TEXT); ''';

  @override
  String get primaryKey => 'exampleId';

  // tableName must be same as createTableQuery's table name
  @override
  String get tableName => 'Examples';
}
