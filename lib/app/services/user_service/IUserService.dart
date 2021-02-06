import 'package:dartz/dartz.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/core/errors/failure.dart';
import 'package:template/core/services/IService.dart';

abstract class IUserService extends IService<User> {
  Future<Either<Failure, List<User>>> localSearchByName(String key);
  Future<Either<Failure, List<User>>> remoteGetAllUsers();
}
