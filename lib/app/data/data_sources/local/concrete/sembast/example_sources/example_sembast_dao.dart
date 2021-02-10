import 'package:template/app/data/models/example.dart';
import 'package:template/core/data_sources/local/sembast/ISembastDao.dart';

class ExampleSembastDao extends ISembastDao<Example> {

  @override
  Example get createGenericInstance => Example();

  @override
  String get mainStoreRef => 'Examples';

  @override
  String get primaryKey => 'exampleId';

}