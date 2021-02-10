import 'package:sqflite/sqflite.dart';
import 'package:template/app/data/data_sources/local/abstract/IExampleLocalDataSrc.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sqflite/ISqfliteDao.dart';
import 'package:template/core/data_sources/local/sqflite/base_sqflite_data_source.dart';


class ExampleSqfliteDataSource extends BaseSqfliteDataSource<Example>
    implements IExampleLocalDataSrc {
  const ExampleSqfliteDataSource(IDbProvider<Database> dbProvider, ISqfliteDao<Example> dao)
      : super(dbProvider, dao);

  // Special methods other than CRUD
  // CRUD methods are inherited

}
