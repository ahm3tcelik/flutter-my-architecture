import 'package:sqflite/sqflite.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';
import 'package:template/core/data_sources/local/sqflite/base_sqflite_data_source.dart';
import 'IExampleLocalDataSrc.dart';

class ExampleSqfliteDataSource extends BaseSqfliteDataSource<Example>
    implements IExampleLocalDataSrc {
  ExampleSqfliteDataSource(IDbProvider<Database> dbProvider, IDao<Example> dao)
      : super(dbProvider, dao);

  // Special methods other than CRUD
  // CRUD methods are inherited

}
