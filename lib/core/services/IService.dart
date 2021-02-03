import 'package:dartz/dartz.dart';
import 'package:template/core/errors/failure.dart';

abstract class IService<T> {
  // LOCAL
  Future<Either<Failure, T>> localGetById(int id);

  Future<Either<Failure, List<T>>> localGetAll();

  Future<Either<Failure, int>> localAdd(T ent);

  Future<Either<Failure, int>> localUpdateById(int id, T ent);

  Future<Either<Failure, int>> localDeleteById(int id, T ent);

  // REMOTE
}
