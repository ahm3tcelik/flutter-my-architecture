import '../../data/data_sources/local/abstract/IUserLocalDataSrc.dart';
import '../../data/data_sources/remote/user_sources/IUserRemoteDataSrc.dart';
import '../../data/models/user.dart';
import '../../../core/services/base_service.dart';
import '../../../core/models/either.dart';
import '../../../core/errors/failure.dart';
import 'IUserService.dart';

class UserService extends BaseService<User, IUserLocalDataSrc>
    implements IUserService {
  final IUserRemoteDataSrc remoteDataSrc;

  UserService(IUserLocalDataSrc localDataSrc, this.remoteDataSrc)
      : super(localDataSrc);

  // LOCAL Services

  @override
  Future<Either<Failure, List<User>>> localSearchByName(String key) async {

    final List<User>? data = await localDataSrc.searchByName(key);
    if (data == null || data.isEmpty) {
      return Left<Failure, List<User>>(Failure("Search not found"));
    }
    return Right<Failure, List<User>>(data);
  }

  // REMOTE Services

  @override
  Future<Either<Failure, List<User>>> remoteGetAllUsers() async {
    var result;
    try {
      final response = await remoteDataSrc.getUsers();

      response.fold(onLeft: (err) {
        result = Left<Failure, List<User>>(err);
      }, onRight: (userList) {
        if (userList != null) {
          if (userList.isNotEmpty) {
            localDataSrc.putFromRemote(userList);
            result = Right<Failure, List<User>>(userList);
          }
        }
        else result = Left<Failure, List<User>>(Failure("Users are not available"));
      });

    } catch (_) {
      result = Left<Failure, List<User>>(Failure('Unexpected error occurred'));
    }
    return result;
  }
}
