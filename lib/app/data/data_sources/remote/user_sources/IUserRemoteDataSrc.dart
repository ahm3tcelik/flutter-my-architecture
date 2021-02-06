import 'package:dartz/dartz.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/core/errors/failure.dart';

abstract class IUserRemoteDataSrc {
  Future<Either<Failure, List<User>>> getUsers();
}