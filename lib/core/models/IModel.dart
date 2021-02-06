abstract class IModel<T> {
  T fromJson(Map<String, Object> json);

  Map<String, Object> toJson();
}
