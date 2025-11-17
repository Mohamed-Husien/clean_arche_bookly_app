import 'package:clean_arche_bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({Params params});
}

abstract class SimilarUseCase<Type, Params, Category> {
  Future<Either<Failure, Type>> call({Params params, Category category});
}
