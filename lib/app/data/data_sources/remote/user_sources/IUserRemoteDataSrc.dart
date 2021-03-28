import '../../../../data/models/user.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/either.dart';

abstract class IUserRemoteDataSrc {
  Future<Either<Failure, List<User>>> getUsers();
}