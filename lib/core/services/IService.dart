import '../models/either.dart';
import '../errors/failure.dart';

abstract class IService<T> {
  // LOCAL
  Future<Either<Failure, T>> localGetById(dynamic id);

  Future<Either<Failure, List<T>>> localGetAll();

  Future<Either<Failure, int>> localAdd(T ent);

  Future<Either<Failure, int>> localUpdateById(dynamic id, T ent);

  Future<Either<Failure, int>> localDeleteById(dynamic id, T ent);

  // REMOTE
}
