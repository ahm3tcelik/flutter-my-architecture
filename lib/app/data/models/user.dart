import 'package:template/core/models/IEntity.dart';
import 'package:template/core/models/IModel.dart';

// It would be extended from IEntity, if the user class will be used to local data source (ex: sqflite)

class User extends IEntity<User> implements IModel<User> {
  int userId;
  String userName;

  User({this.userId, this.userName});

  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userName = json['userName'];

  @override
  User fromMap(Map<String, Object> map) => User.fromJson(map);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "userId": this.userId,
      "userName": this.userName
    };
  }

  @override
  Map<String, Object> toJson() {
    return {"userId": this.userId, "userName": this.userName};
  }
}
