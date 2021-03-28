import '../../data/models/user.dart';
import '../../../core/errors/failure.dart';
import '../../../core/models/either.dart';
import '../../../core/services/IService.dart';

abstract class IUserService extends IService<User> {
  Future<Either<Failure, List<User>>> localSearchByName(String key);
  Future<Either<Failure, List<User>>> remoteGetAllUsers();
}
