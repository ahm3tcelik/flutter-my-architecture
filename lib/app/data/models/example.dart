import 'package:template/core/models/IEntity.dart';
import 'package:template/core/models/IModel.dart';

// It would be extended from IEntity, if the user class will be used to local data source (ex: sqflite)

class Example extends IEntity<Example> implements IModel<Example> {
  int exampleId;
  String exampleData;

  Example({this.exampleId, this.exampleData});

  Example.fromJson(Map<String, dynamic> json)
      : exampleId = json['exampleId'],
        exampleData = json['exampleData'];

  @override
  Example fromMap(Map<String, Object> map) => Example.fromJson(map);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "exampleId": this.exampleId,
      "exampleData": this.exampleData
    };
  }

  @override
  Map<String, Object> toJson() {
    return {"userId": this.exampleId, "userName": this.exampleData};
  }
}
