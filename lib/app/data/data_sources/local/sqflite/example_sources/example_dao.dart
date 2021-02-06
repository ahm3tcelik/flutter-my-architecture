import 'package:template/app/data/models/example.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';


class ExampleDao extends IDao<Example> {

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
