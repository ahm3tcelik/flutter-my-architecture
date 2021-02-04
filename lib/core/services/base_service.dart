import 'package:dartz/dartz.dart';
import 'package:template/core/data_sources/local/ILocalDataSource.dart';
import 'package:template/core/errors/failure.dart';
import 'package:template/core/models/IEntity.dart';
import 'package:template/core/services/IService.dart';

class BaseService<T extends IEntity, TLocalDataSource extends ILocalDataSource> implements IService<T> {
  final TLocalDataSource localDataSrc;

  BaseService(this.localDataSrc);

  @override
  Future<Either<Failure, int>> localAdd(T ent) async {
    final int newId = await localDataSrc.add(ent);
    if (newId == null) {
      return const Left(Failure("Data could not be added"));
    }
    return Right(newId);
  }

  @override
  Future<Either<Failure, int>> localDeleteById(int id, T ent) async {
    final int affectedNum = await localDataSrc.delete(id, ent);
    if (affectedNum == null || affectedNum < 1) {
      return const Left(Failure("Data could not be deleted"));
    }
    return Right(affectedNum);
  }

  @override
  Future<Either<Failure, T>> localGetById(int id) async {
    final T data = await localDataSrc.get(id);
    if (data == null) {
      return const Left(Failure('No app.data available'));
    }
    return Right(data);
  }

  @override
  Future<Either<Failure, List<T>>> localGetAll() async {
    final List<T> data = await localDataSrc.getAll();
    if (data == null || data.isEmpty) {
      return const Left(Failure('No app.data available'));
    }
    return Right(data);
  }

  @override
  Future<Either<Failure, int>> localUpdateById(int id, T ent) async {
    final int affectedNum = await localDataSrc.update(id, ent);
    if (affectedNum == null || affectedNum < 1) {
      return const Left(Failure("Data could not be updated"));
    }
    return Right(affectedNum);
  }
}
