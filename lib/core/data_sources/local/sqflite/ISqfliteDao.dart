import 'package:template/core/data_sources/local/IDao.dart';
import 'package:template/core/models/IEntity.dart';

abstract class ISqfliteDao<T extends IEntity> extends IDao<T> {
  String get createTableQuery;
  String get tableName;
}