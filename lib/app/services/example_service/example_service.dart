import '../../data/data_sources/local/abstract/IExampleLocalDataSrc.dart';
import '../../data/models/example.dart';
import '../../services/example_service/IExampleService.dart';
import '../../../core/services/base_service.dart';

class ExampleService extends BaseService<Example, IExampleLocalDataSrc>
    implements IExampleService {
  ExampleService(IExampleLocalDataSrc localDataSrc) : super(localDataSrc);
}