import 'package:sembast/sembast.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sembast/ISembastDao.dart';
import 'package:template/core/data_sources/local/sembast/base_sembast_data_source.dart';
import '../../../abstract/IExampleLocalDataSrc.dart';

class ExampleSembastDataSource extends BaseSembastDataSource<Example>
    implements IExampleLocalDataSrc {
  const ExampleSembastDataSource(
      IDbProvider<Database> dbProvider, ISembastDao<Example> dao)
      : super(dbProvider, dao);

  // Special methods other than CRUD
  // CRUD methods are inherited
}
