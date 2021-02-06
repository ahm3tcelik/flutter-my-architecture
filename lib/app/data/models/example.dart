import 'package:json_annotation/json_annotation.dart';
import 'package:template/core/models/IEntity.dart';
import 'package:template/core/models/IModel.dart';

part 'example.g.dart';

// It would be extended from IEntity, if the user class will be used to local data source (ex: sqflite)
@JsonSerializable()
class Example extends IEntity<Example> implements IModel<Example> {
  int exampleId;
  String exampleData;

  Example({this.exampleId, this.exampleData});

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  @override
  Example fromJson(Map<String, Object> json) => _$ExampleFromJson(json);

  @override
  Map<String, Object> toJson() => _$ExampleToJson(this);
}
