import 'package:template/app/data/models/example.dart';
import 'package:template/core/data_sources/local/ILocalDataSource.dart';


abstract class IExampleLocalDataSrc extends ILocalDataSource<Example> {
  // Special methods other than CRUD
  // CRUD methods are inherited
}