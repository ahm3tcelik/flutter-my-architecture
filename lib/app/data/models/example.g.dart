// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return Example(
    exampleId: json['exampleId'] as int,
    exampleData: json['exampleData'] as String,
  );
}

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'exampleId': instance.exampleId,
      'exampleData': instance.exampleData,
    };
