import 'package:dartz/dartz.dart';
import '../../../../data/models/user.dart';
import '../../../../../core/errors/failure.dart';

abstract class IUserRemoteDataSrc {
  Future<Either<Failure, List<User>>> getUsers();
}