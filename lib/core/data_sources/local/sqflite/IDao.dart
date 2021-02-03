abstract class IDao<T> {

  String get createTableQuery;
  String get tableName;
  String get primaryKey;

  T get createGenericInstance;

}