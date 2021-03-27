import 'package:dartz/dartz.dart';
import '../../data/models/user.dart';
import '../../../core/errors/failure.dart';
import '../../../core/services/IService.dart';

abstract class IUserService extends IService<User> {
  Future<Either<Failure, List<User>>> localSearchByName(String key);
  Future<Either<Failure, List<User>>> remoteGetAllUsers();
}
