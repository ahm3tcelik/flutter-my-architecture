import 'package:dartz/dartz.dart';
import 'package:template/app/data/data_sources/local/abstract/IUserLocalDataSrc.dart';
import 'package:template/app/data/data_sources/remote/user_sources/IUserRemoteDataSrc.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/core/errors/failure.dart';
import 'package:template/core/services/base_service.dart';

class UserService extends BaseService<User, IUserLocalDataSrc>
    implements IUserService {
  final IUserRemoteDataSrc remoteDataSrc;

  UserService(IUserLocalDataSrc localDataSrc, this.remoteDataSrc)
      : super(localDataSrc);

  // LOCAL Services

  @override
  Future<Either<Failure, List<User>>> localSearchByName(String key) async {
    final List<User> data = await localDataSrc.searchByName(key);
    if (data == null || data.isEmpty) {
      return const Left(Failure("Search not found"));
    }
    return Right(data);
  }

  // REMOTE Services

  @override
  Future<Either<Failure, List<User>>> remoteGetAllUsers() async {
    try {
      final response = await remoteDataSrc.getUsers();
      return response.fold((err) {
        return Left(err);
      }, (userList) {
        if (userList != null || userList.isEmpty) {
          localDataSrc.putFromRemote(userList);
          return Right(userList);
        }
        return const Left(Failure("Users are not available"));
      });
    } catch (_) {
      return const Left(Failure('Unexpected error occurred'));
    }
  }
}
