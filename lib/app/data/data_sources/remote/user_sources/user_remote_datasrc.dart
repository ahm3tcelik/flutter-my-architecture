import 'package:dio/dio.dart';
import '../../../../data/api/api_client.dart';
import '../../../../data/data_sources/remote/user_sources/IUserRemoteDataSrc.dart';
import '../../../../data/models/user.dart';
import '../../../../../core/models/either.dart';
import '../../../../../core/errors/failure.dart';

class UserRemoteDataSrc implements IUserRemoteDataSrc {
  final ApiClient apiClient;

  UserRemoteDataSrc(this.apiClient);

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final users = await apiClient.getAllUsers();
      return Right<Failure, List<User>>(users);
    } on DioError catch (err) {
      return Left<Failure, List<User>>(Failure(err.message));
    } on Exception catch (_) {
      return const Left<Failure, List<User>>(Failure("An error occurred"));
    }
  }
}
