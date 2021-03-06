import 'package:json_annotation/json_annotation.dart';
import '../../../core/models/IEntity.dart';
import '../../../core/models/IModel.dart';

part 'user.g.dart';

// It would be extended from IEntity, if the user class will be used to local data source (ex: sqflite)

@JsonSerializable()
class User extends IEntity<User> implements IModel<User> {
  String? userId;
  String? userName;

  User({this.userId, this.userName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
