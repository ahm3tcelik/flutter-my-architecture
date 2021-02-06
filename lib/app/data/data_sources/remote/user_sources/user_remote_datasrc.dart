import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:template/app/data/api/api_client.dart';
import 'package:template/app/data/data_sources/remote/user_sources/IUserRemoteDataSrc.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/core/errors/failure.dart';

class UserRemoteDataSrc implements IUserRemoteDataSrc {
  final ApiClient apiClient;

  UserRemoteDataSrc(this.apiClient);

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final users = await apiClient.getAllUsers();
      return Right(users);
    } on DioError catch (err) {
      return Left(Failure(err.message));
    } on Exception catch (_) {
      return const Left(Failure("An error occurred"));
    }
  }
}
