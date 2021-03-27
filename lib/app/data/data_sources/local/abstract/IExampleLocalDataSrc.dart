import '../../../../data/models/example.dart';
import '../../../../../core/data_sources/local/ILocalDataSource.dart';

abstract class IExampleLocalDataSrc extends ILocalDataSource<Example> {
  // Special methods other than CRUD
  // CRUD methods are inherited
}
