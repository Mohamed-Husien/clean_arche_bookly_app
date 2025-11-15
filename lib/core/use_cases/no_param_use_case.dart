import 'package:clean_arche_bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
