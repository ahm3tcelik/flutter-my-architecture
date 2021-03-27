import '../../../../core/data_sources/local/IDao.dart';
import '../../../../core/models/IEntity.dart';

abstract class ISembastDao<T extends IEntity> extends IDao<T> {
  String get mainStoreRef;
}