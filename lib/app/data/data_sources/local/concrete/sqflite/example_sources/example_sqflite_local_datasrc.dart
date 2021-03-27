import 'package:template/core/data_sources/local/IDao.dart';
import '../../../../../../../app/data/data_sources/local/abstract/IExampleLocalDataSrc.dart';
import '../../../../../../../app/data/models/example.dart';
import '../../../../../../../core/data_sources/local/IDbProvider.dart';
import '../../../../../../../core/data_sources/local/sqflite/base_sqflite_data_source.dart';

class ExampleSqfliteDataSource extends BaseSqfliteDataSource<Example>
    implements IExampleLocalDataSrc {
  const ExampleSqfliteDataSource(IDbProvider<dynamic> dbProvider, IDao<Example> dao)
      : super(dbProvider, dao);

  // Special methods other than CRUD
  // CRUD methods are inherited

}
