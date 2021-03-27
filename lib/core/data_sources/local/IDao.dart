import '../../../core/models/IEntity.dart';

abstract class IDao<T extends IEntity> {
  T get createGenericInstance;
  String get primaryKey;
}