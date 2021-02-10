import 'package:template/app/data/data_sources/local/abstract/IExampleLocalDataSrc.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/app/services/example_service/IExampleService.dart';
import 'package:template/core/services/base_service.dart';

class ExampleService extends BaseService<Example, IExampleLocalDataSrc>
    implements IExampleService {
  ExampleService(IExampleLocalDataSrc localDataSrc) : super(localDataSrc);
}