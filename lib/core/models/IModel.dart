abstract class IModel<T> {
  T fromMap(Map<String, Object> map);

  Map<String, Object> toJson();
}
