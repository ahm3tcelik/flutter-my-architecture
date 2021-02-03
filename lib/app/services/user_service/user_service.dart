import 'package:dartz/dartz.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/IUserLocalDataSrc.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/core/errors/failure.dart';
import 'package:template/core/services/base_service.dart';


class UserService extends BaseService<User, IUserLocalDataSrc>
    implements IUserService {
  UserService(IUserLocalDataSrc localDataSrc) : super(localDataSrc);

  @override
  Future<Either<Failure, List<User>>> searchByName(String key) async {
    final List<User> data = await localDataSrc.searchByName(key);
    if (data == null || data.isEmpty) {
      return const Left(Failure("Search not found"));
    }
    return Right(data);
  }
}
