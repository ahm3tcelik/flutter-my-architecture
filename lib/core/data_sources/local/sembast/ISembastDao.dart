import 'package:template/core/data_sources/local/IDao.dart';
import 'package:template/core/models/IEntity.dart';

abstract class ISembastDao<T extends IEntity> extends IDao<T> {
  String get mainStoreRef;
}